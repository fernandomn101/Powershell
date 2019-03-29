if($usuarios -eq $null){
    $usuarios = get-aduser -Filter {Name -like '*'} -SearchBase "OU=Disabled Admin Accounts,OU=Data Administrators,DC=contoso,DC=com" | Sort-Object samaccountname
}

cd $PSScriptRoot
$constructores = @()
$constructor = @()
$grupos = @()
$ruta = ".\Adminscleaner(3).csv"


Remove-Item -Path $ruta -ErrorAction SilentlyContinue


$salida = ("User,Group,Status")
$salida | out-file -FilePath $ruta -Append -Encoding utf8



#desde aqui solo hay que pasar los usuarios y borrar a esos usuarios de todos los grupos menos el de domain users


foreach($usuario in $usuarios){

    $grupos = Get-ADPrincipalGroupMembership $usuario.Samaccountname | Where-Object {$_.Name -ne "Domain Users"} | select name | Sort-Object name
    
    if ($grupos.count -ne 0){
        foreach($grupo in $grupos){
            try{
                $salida = ($usuario.SamAccountName+","+$grupo.name+",DELETED")

                Remove-ADGroupMember -Identity $grupo.name -Members $usuario.SamAccountName -Confirm:$false

                $salida | out-file -FilePath $ruta -Append -Encoding utf8           
                
                Write-Host($salida) -ForegroundColor Green

            }catch{

                $salida = ($usuario.SamAccountName+","+$grupo.name+",NOT DELETED")
                $salida | out-file -FilePath $ruta -Append -Encoding utf8
                Write-Host($salida) -ForegroundColor Red
            
            }

        }
    }


}





