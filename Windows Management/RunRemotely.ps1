#Enable-PSRemoting 
if ($MyCredentials -eq $null){

    $MyCredentials = Get-Credential -Message "." -UserName "contoso\JohnDoe"

}

Invoke-Command -credential $MyCredentials -computer ExampleServer.contoso.com -ScriptBlock{

    Get-ChildItem C:\Users\johnDoe\Desktop

}