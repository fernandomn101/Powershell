Import-module Msonline -Verbose
cls

$emailaccount = "john.doe@contoso.com"

$LiveCred =  Get-Credential -UserName $emailaccount -Message "Enter the password"
$url = "https://ps.outlook.com/PowerShell-LiveID?PSVersion=5.1.16299.637"

try{
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $url -Credential $LiveCred -Authentication Basic -AllowRedirection
    Import-PSSession $Session 
    Connect-MsolService –Credential $LiveCred
}catch{
    Write-Host ("Error password") -ForegroundColor Yellow
}
