$From = “john.deo@hotmail.com”
$To = "anthony.doe@gmail.com"
$Attachment = “”
$Subject = “Test mandar email auto”
$Body = "Hola que tal esto es el body, this is the body from the email"
$SMTPServer = "outlook.office365.com”
$SMTPPort = “587”

Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -UseSsl -Credential (Get-Credential) –DeliveryNotificationOption OnSuccess