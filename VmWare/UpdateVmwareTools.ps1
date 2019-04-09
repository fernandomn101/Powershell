Connect-VIServer -Server vcenterserver.contoso.com -Protocol https

$maquinas = Get-VM | Select name,Version,Notes | Where-Object {$_.version -ne "v10"} | Sort-Object -Property version,name

foreach($maq in $maquinas){
   
    New-Snapshot -Name ($maq.Name+" Snapshot") -VM $maq.Name
   
    Write-Host("Snapshot ("+$maq.Name+" Snapshot) creado para -> "+$maq.Name)
    
    try{
        
        Update-tools -VM $maq.Name -NoReboot -ErrorAction Stop
        $snap = Get-Snapshot -vm $maq.Name
        Remove-Snapshot -Snapshot $snap -Confirm
    
    }catch{
        Write-Host ("Error al actualizar"+$maq.Name) -ForegroundColor Red
    }
}

Disconnect-VIServer * -Force


###############################
#Basic commands with snapshots#
###############################

#Crear snapshot
New-Snapshot -Name "Snapshot test" -VM "servername"

#obtener snapshot
$snap = Get-Snapshot -vm "servername"


#borrar snapshot
Remove-Snapshot -Snapshot $snap -Confirm

#actualizar las vm con
Update-tools -VM $maq.Name



