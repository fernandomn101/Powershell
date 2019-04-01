$vcenter="vcenterserver.contoso.com"
Connect-VIServer -Server $vcenter -Protocol https

$csv = Import-Csv -Path ~\Desktop\servers.csv
foreach($maquina in $csv){

   Get-VM -Name $maquina.Name | select Name,Powerstate,ResourcePool,@{N="Cluster";E={Get-Cluster -VM $_}}
    
}
