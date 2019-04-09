﻿function ConectarSccm(){
    # Uncomment the line below if running in an environment where script signing is 
    # required.
    #Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process

    # Site configuration
    $SiteCode = "BB1" # Site code / BBDDName
    $ProviderMachineName = "SCCMServer.Contoso.com" # SMS Provider machine name

    # Customizations
    $initParams = @{}
    #$initParams.Add("Verbose", $true) # Uncomment this line to enable verbose logging
    #$initParams.Add("ErrorAction", "Stop") # Uncomment this line to stop the script on any errors

    # Do not change anything below this line

    # Import the ConfigurationManager.psd1 module 
    if((Get-Module ConfigurationManager) -eq $null) {
        Import-Module "$($ENV:SMS_ADMIN_UI_PATH)\..\ConfigurationManager.psd1" @initParams 
    }

    # Connect to the site's drive if it is not already present
    if((Get-PSDrive -Name $SiteCode -PSProvider CMSite -ErrorAction SilentlyContinue) -eq $null) {
        New-PSDrive -Name $SiteCode -PSProvider CMSite -Root $ProviderMachineName @initParams
    }

    # Set the current location to be the site code.
    Set-Location "$($SiteCode):\" @initParams

}

if($conectado -ne $true){
    ConectarSccm
    $conectado = $true
    Write-Host ("Conectado a sccm") -ForegroundColor Green
}

#una device collection al azar
#$coleccion = Get-CMDeviceCollection -Id AA00001

#Colleciones nuestras
Get-CMDeviceCollection -Name 'Servers for patching' | select name,collectionId

#Dispositivos que pertenecen a una coleccion
#Get-CMDevice -CollectionId $coleccion.CollectionID | select name







