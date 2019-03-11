Connect-MsolService
 
$UserPrincipalName = "John.Doe@contoso.com" 

Get-MsolUser -UserPrincipalName $UserPrincipalName | select licenses

$LicenseE3 = "Contoso:ENTERPRISEPACK"

$LicenseE1 = "Contoso:STANDARDPACK"

$LicenseExOnline = "Contoso:EXCHANGEENTERPRISE"

Set-MsolUserLicense -UserPrincipalName $UserPrincipalName -RemoveLicenses ($LicenseE1,$LicenseExOnline) -AddLicenses ($LicenseE3)

Get-MsolUser -UserPrincipalName $UserPrincipalName | select licenses

