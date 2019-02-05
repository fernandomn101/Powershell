#Neccesary have installed VmWare modules

$vcenter = "hostname.contoso.corp"

$conection = Connect-VIServer -Server $vcenter -Protocol https


#Return  Name,Version,OS,IP-Address,Folder of all the servers in Vcenter

$path = "~\Desktop\servers.txt"
$servers = Get-VM
Remove-Item $path -ErrorAction SilentlyContinue
foreach($server in $servers){
	$output = $server.Name +","+$server.Version+","+$server.Guest.OSFullName+","+$server.Guest.IPAddress+","+$server.Folder
    $output | Out-File $path -Encoding utf8 -Append
    $output
}


Disconnect-VIServer -Server * -Confirm:$false
