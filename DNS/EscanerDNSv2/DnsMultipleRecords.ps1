cd $PSScriptRoot
$outcsv= ".\DnsScaner.csv"
$outcsv2= ".\DnsScaner2.csv"

$ranges = ("10.30.0.","10.30.10.","10.30.20.","10.21.10.","10.21.20.")
$dns = @()
foreach($range in $ranges){
    Write-Host("Escaneando $range") -ForegroundColor DarkCyan
    for($i=1;$i -le 254; $i++){
        $ip =[String]($range+[String]$i)
        try{
            $dns += [System.Net.Dns]::GetHostByAddress($ip)
            #Write-Host("Encontrada $ip")
        }catch{
            #Write-Host("Error en $ip") -ForegroundColor DarkMagenta
        }
    }
}

##Ips con dos servidores
$dosmaquinas = $dns | Where-Object {$_.Aliases -ne ""}
##Servidores con 2 ips
$dosips = $dns | Group-Object Hostname | Where-Object {$_.Count -ne 1}


######################Exportación de los datos######################
Remove-Item $outcsv  -ErrorAction SilentlyContinue
Remove-Item $outcsv2 -ErrorAction SilentlyContinue

('Server,Alias,IP Address') | Out-file $outcsv -Append -Encoding UTF8
foreach ($dosmaq in $dosmaquinas){
    ($dosmaq.hostname+','+$dosmaq.Aliases+','+$dosmaq.addresslist.ipaddresstostring) | 
    Out-file $outcsv -Append -Encoding UTF8
}

('Server,Alias,IP Address') | Out-file $outcsv2 -Append -Encoding UTF8
foreach ($maq in $dosips){
    $Repetidas = $dns | Where-Object {$_.Hostname -eq $maq.Name}
    foreach ($repe in $Repetidas){
        ($repe.hostname+','+$repe.Aliases+','+$repe.addresslist.ipaddresstostring) | 
        Out-file $outcsv2 -Append -Encoding UTF8
    }
}
####################################################################

#########################################
###########Variables estaticas###########
#########################################
$smtpserver = "Servername.contoso.com"
$smtpip     = "10.0.0.10"
$rtte       = ("john.doe@contoso.com")
$destino    = ("marie.doe@contoso.com","antonie.doe@contoso.com")
$cc         = ("frank.doe@contoso.com")
$bcc        = ("john.doe@contoso.com")


function crearcuerpo([String]$base,[String]$injerto){
    #Modificar titulo
    $texto = $base
    $texto = $texto.Replace('HTML TABLE','Server DNS Duplicated Values')
    $texto = $texto.Replace('<table>','<p>The Servers bellow have multiple name for the same IP Address:</p><table>')
    $texto = $texto.Replace('</table>',("</table><br/><p>The Servers bellow have multiple IP Addresses for the same name</p>"+$injerto))
    $texto = $texto.Replace('</body>',('<br/><footer>Thank you!<br/>Regards,<br/><br/>Fernando Mohíno Navarro<br/>Infrastructure Operations<br/>Burberry Ltd.<br/><a href="mailto:fernando.mohino@burberry.com">fernando.mohino@burberry.com</a></footer></body>'))
    return $texto
    
}

#Esta funcion te saca la tabla del html
function sacatablacsv2 ($csv){
    $csvstr = $csv | ConvertTo-Html | Out-String
    $etiqinicio = '<table>'
    $etiqfin = '</table>'
    $d = $csvstr.IndexOf($etiqinicio)
    $l = ($csvstr.IndexOf($etiqfin)+($etiqfin.Length)-$d)
    $csvstr= $csvstr.Substring($d,$l)
    return $csvstr
}

########################################
###########Variables globales###########
########################################
$asunto = "DNS record check"
$inicio = "Hi,`n`nThe machines below have been identified by us system with the following issues in the DNS registry.`n`n"
$csv1 = Import-csv $outcsv
$csv2 = Import-csv $outcsv2

$body = ""
$body = crearcuerpo -base ($csv1 | ConvertTo-Html | Out-String) -injerto (sacatablacsv2 $csv2)

#############inicio programa#############
    
#Ejecucion produccion
Send-MailMessage -From $rtte -To $destino -Subject $asunto -cc $cc -Bcc $bcc -SmtpServer $smtpip -Body $body -Encoding ([System.Text.Encoding]::UTF8) -BodyAsHtml
    
#Ejecucion prueba
#Send-MailMessage -From $rtte -To $rtte -Subject $asunto -cc $rtte -Bcc $rtte -SmtpServer $smtpip -Body $body -Encoding ([System.Text.Encoding]::UTF8) -BodyAsHtml

Write-Host("Mail mandado") -ForegroundColor Green