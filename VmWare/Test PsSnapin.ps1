Add-PSSnapin VMware.VimAutomation.Core

$con3 = Connect-VIServer -Server vcenter.contoso.com -Protocol https

Get-Datacenter 