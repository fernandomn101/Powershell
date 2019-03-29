cd $PSScriptRoot

$serverotherdomain = "ServerAd.contoso2.com"
$group = "O365licenses"

$user = Get-ADGroupMember -Server $serverotherdomain -Identity $group | Where-Object {$_.Samaccountname -like "*"} | Sort-Object samaccountname

$salida = @()

foreach($usu in $user){
    if($usu.SamAccountName -ne ""){
        $salida += Get-ADUser -Server $serverotherdomain -Identity $usu
    }    
}

$salida | select name,samaccountname,userprincipalname,mail | Export-Csv .\users.csv
