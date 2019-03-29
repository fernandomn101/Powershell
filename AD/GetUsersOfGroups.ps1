function existegrupo($nombre){
    $existe = $true
    try{
        $usuarios = Get-ADGroupMember -Identity "$nombre" | select name,samaccountname,objectclass -ErrorAction Stop
    }catch{
        $existe = $false
    }
    return $existe
}

function devolverusuarios($nombre){
     return Get-ADGroupMember -Identity "$nombre" | select name,samaccountname,objectclass -ErrorAction Stop
}


$csv = Import-Csv '~\Desktop\Gruops.csv'
$csvsalida = "~\desktop\Usersoutput.csv"
Remove-Item -Path $csvsalida -ErrorAction SilentlyContinue
$grupos=@()
$i=0
foreach($row in $csv){
    $name = $row.GM.Trim()
    $porcentj= [Math]::Round((($i / $csv.Count)*100))

    Write-Progress -Activity "Buscando usuarios de grupos...$porcentj%" -status "Escaneando $name" -percentComplete (($i / $csv.Count)*100)
    
    if(existegrupo -nombre $name){
         
        $miembros = devolverusuarios -nombre $name 
        Write-Host("Obteniendo usuarios de $name")
        foreach($miembro in $miembros){
            if($miembro.objectclass -eq "group"){
                $usersgrupos = Get-ADGroupMember -Identity $miembro.name |select name,samaccountname,objectclass
                foreach($userg in $usersgrupos){
                    $obj = New-Object PscustomObject  
                    $obj | Add-Member "Name" $userg.Name
                    $obj | Add-Member "Logon name" $userg.samaccountname
                    $obj | Add-Member "SubGroup" $miembro.name            
                    $obj | Add-Member "Group" $name            
                    $obj | export-csv -Path $csvsalida -Append -NoTypeInformation
                }
            }else{
                $obj = New-Object PscustomObject  
                $obj | Add-Member "Name" $miembro.Name
                $obj | Add-Member "Logon name" $miembro.samaccountname
                $obj | Add-Member "SubGroup" ""       
                $obj | Add-Member "Group" $name 
                $obj | export-csv -Path $csvsalida -Append -NoTypeInformation
            }
        }
        
    }else{
       Write-Host("NO ENCONTRADO $name") 
    }
    $i+=1
}

