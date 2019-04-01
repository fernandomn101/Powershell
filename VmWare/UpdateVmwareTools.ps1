Connect-VIServer -Server vcenterserver.contoso.com -Protocol https

$maquinas = Get-VM | Select name,Version,Notes | Where-Object {$_.version -ne "v10"} | Sort-Object -Property version,name

foreach($maq in $maquinas){
   New-Snapshot -Name ($maq.NAME+" Snapshot") -VM $maq.name
   Write-Host("New Snapshot for "+$maq.Name)

   Get-VM $maq.Name | Update-Tools -NoReboot

}

Disconnect-VIServer * -Force