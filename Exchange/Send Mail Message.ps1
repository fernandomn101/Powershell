#This is a simple example of how send mail messages automatically via exchange

#STMP Server -> The ip Address of your Exchange Server
    
    $SMTPServer = "192.168.1.10"  

#Sender email address
    
    $from       = "John.Doe@contoso.com"

#Email recipent

    $To         = "John.Doe@contoso.com"

#CC (if you want a copy of the email in your mailbox, you need to set the cc or bcc property with your email address)

    $cc         = $from

#Subject

    $EmailSubj  = "Test Subject"

#Body#
## It is possible to write the body of very diferent ways; As html code, directly the variable or like a text between many others

    $EmailBody  = "This is the body of the email"

#Email subject ## If you want send the body with html format, you must add -Bodyashtml property

Send-MailMessage -From $From -To $To -Cc $cc -Body $EmailBody -Subject $EmailSubj -SmtpServer $SMTPServer -Encoding ([System.Text.Encoding]::UTF8) -BodyAsHtml
  