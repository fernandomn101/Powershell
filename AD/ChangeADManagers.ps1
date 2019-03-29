$csv = Import-Csv '~\Desktop\UsersManagers.csv' -Delimiter ',' 

foreach($u in $csv){
    
    $manager = Get-ADUser $u.Manager
    try{
        Get-ADUser $u.SAMAccountName -Properties manager -ErrorAction Stop| Set-ADUser -Manager $manager -ErrorAction Stop
        Write-Host($u.SAMAccountName + "cambiado el manager a " + $manager)
    }catch{
        Write-Host("No se ha podido cambiar el manager de " + $u.SAMAccountName )
    }
}