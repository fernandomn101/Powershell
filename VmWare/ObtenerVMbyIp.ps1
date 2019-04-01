Connect-VIServer -Server vcenterserver.contoso.com -Protocol https 

Get-View -ViewType VirtualMachine | ?{ $_.Guest.IPAddress -eq "10.0.0.2" }
