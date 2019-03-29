
$html = Get-ADUser -Filter {Name -like "*"} -SearchBase "OU=Admin User Accounts,DC=Contoso,DC=corp" | select name,userprincipalname,enabled | Sort-Object enabled,name | ConvertTo-Html
$html = [String]$html

#################### Info Mails ####################

$smtpserver = "oneserver.contoso.com"
$smtpip     = "10.0.0.1"
$rttebcc    = "john.doe@contoso.com"

$destino    = "james.doe@contoso.com"
$asunto     = "Administrator Users Monthly report"

$encabezado = "<body>
               <p>Hi James,</p>
               <p>Below you can find the report of the administrator users in Constoso domain</p> "
$html = $html.Replace("<body>",$encabezado)

$firmafin ='<br/><footer>Thank you!<br/>Regards,<br/>
            <br/>John Doe<br/>Technical Team<br/>Contoso co.<br/>
            <a href="mailto:john.doe@contoso.com">john.doe@contoso.com</a>
            </footer>
            </body>'
$html = $html.Replace("</body>",$firmafin)    

Send-MailMessage -From $rttebcc -To $rttebcc -Subject $asunto -Bcc $rttebcc -SmtpServer $smtpip -Body $html -Encoding ([System.Text.Encoding]::UTF8) -BodyAsHtml

    Write-Host("############################# Email a mandado #############################")   -ForegroundColor DarkYellow
    Write-Host("Email de ->`t`t`t`t $rttebcc")
    Write-Host("Destinatarios ->`t`t $destino")
    Write-Host("CC oculto ->`t`t`t $rttebcc")
    Write-Host("###########################################################################`n") -ForegroundColor Yellow
