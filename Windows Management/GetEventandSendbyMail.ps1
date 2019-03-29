

        #Get newest event 4740
        $Event   = Get-EventLog -LogName Security -InstanceId 4673 -Newest 1 #You must change the instanceId, i used 4673 for send test emails to myself 

        #Get user form the $event
        $usuario = Get-ADUser $Event.UserName -Properties name,UserprincipalName,telephonenumber,officephone,homephone,manager,Samaccountname

        #Get manager info from the user
        $manager = $usuario.Manager | Get-ADUser -Properties name,userprincipalname
        
        #Print info via console(This are all the field that you require "username, emailaddress, phone numbers..." ), juste need to use it as you want
        Write-Host( "User   :   "+$usuario.Name+" "+$usuario.SamAccountName+" "+$usuario.UserPrincipalName+" "+$usuario.telephonenumber+" "+$usuario.OfficePhone+" "+$usuario.HomePhone+
                  "`nManager:   "+$manager.Name+" "+$manager.SamAccountName+" "+$manager.UserPrincipalName)
                  
        #FMN. Let's start to build the email
            #STMP Server
                $SMTPServer = "10.0.0.0"
            #First the sender (I sent you this variable as $rttebcc)
                $from       = "John.doe@contoso.com"
            #Email recipent (I sent you this one as $destino)
                $To         = "John.doe@contoso.com"
            #CC (if you want a copy of the email in your mailbox, you need to set the cc or bcc property with your email address; also i sent you this property as $rttebcc)
                $cc         = $from
            #Subject
                $EmailSubj  = "User Account locked out"
            #Body
                $EmailBody  = $Event.Message + "`r`n`t" + $Event.TimeGenerated

        #Email subject

        Send-MailMessage -From $From -To $To -Cc $from -Body $EmailBody -Subject $EmailSubj -SmtpServer $SMTPServer -Encoding ([System.Text.Encoding]::UTF8) -BodyAsHtml
  

  
