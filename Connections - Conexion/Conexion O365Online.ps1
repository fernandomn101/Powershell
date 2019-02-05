$user = "john.doe@contoso.com"
$pass = (ConvertTo-SecureString -AsPlainText "Abcd1234" -Force)


Import-Module MSOnline
$O365Cred = Get-Credential -Credential $user 
$O365Session = New-PSSession –ConfigurationName Microsoft.Exchange -ConnectionUri "https://ps.outlook.com/PowerShell-LiveID?PSVersion=5.1.16299.666 " -Credential $O365Cred -Authentication Basic -AllowRedirection
Import-PSSession $O365Session
Connect-MsolService –Credential $O365Cred 