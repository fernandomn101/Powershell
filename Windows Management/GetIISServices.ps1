#Parte que coge el csv y comprueba los servicios
#
$maquinas = Import-Csv -Path ~\Desktop\servers.csv

foreach ($PC in $maquinas) { 
    $svcIIS = " "
    $svcIISstat= " "
    $svcIISYN=$false
    $svcOMS = " "
    $svcOMSstat= " "
    $svcOMSYN=$false
    $Computer = $PC.Nombre;  
    

    $obj = New-Object PscustomObject
    $obj | Add-Member 'Computer' $Computer
    
    Write-host ("Comprobando $Computer")
    
    try{
        Write-host ("Comprobando IIS")
        $svcIIS =  Get-Service -ComputerName $Computer -Name W3SVC -ErrorAction Stop
        $svcIISstat = $svcIIS.Status
        $svcIISYN = $true
        
    }catch{
        $svcIISYN = $false
    }finally{
        $obj | Add-Member 'IIS' $svcIISYN
        $obj | Add-Member 'IISstatus' $svcIISStat
    }
    
    try{
        Write-host ("Comprobando OMS")
        $svcOMS =  Get-Service -ComputerName $Computer -Name HealthService -ErrorAction Stop
        $svcOMSstat = $svcOMS.Status
        $svcOMSYN = $true
    }catch{
        $svcOMSYN = $false
    }finally{
        $obj | Add-Member 'OMS' $svcOMSYN
        $obj | Add-Member 'OMSstatus' $svcOMSstat
    }

    #Write-Host($Computer.name+" "+ $svcIIS+" "+ $svcIISstat)

    Write-host ("Insertado $Computer")
    Write-host ("-------------------------")
    $obj |Export-Csv -NoTypeInformation -Path "~\services.csv" -Append | %{$_ -replace '"',""}
    
}#>



