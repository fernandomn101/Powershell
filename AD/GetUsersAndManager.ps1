################################################################################
##Este script obtiene todos los usuarios de un grupo con su Title y su Manager##
################################################################################

##Al ejecutar, la ventana de comandos pide el grupo al que consultar     

#Solo hay que cambiar el grupo al que afecta#
$grupo = Read-Host -Prompt "Introduce el nombre del grupo"
$path = "~\Desktop\usersgroup.csv"
#$grupo = "GRG.DIS.EMEIA.AllTeamMeeting-Italy"

$usuarios = Get-ADGroupMember -Identity $grupo | Sort-Object name
foreach ($u in $usuarios){
    try{
        $usu = Get-ADUser -Identity $u.Samaccountname -Properties title,manager | select name,samaccountname,title,manager
        $manager = Get-ADUser ($usu.manager)
        $obj = New-Object PsObject 
        $obj | Add-Member Nombre $usu.name
        $obj | Add-Member Logonname $usu.samaccountname
        $obj | Add-Member Title $usu.title
        $obj | Add-Member Manager $manager.Name
         
        $obj | Export-Csv -NoTypeInformation -Path $path  -Append | %{$_ -replace '"',""}
        $obj
    }catch{}
}

Write-Host ("`n`n")
Write-Host ("---------------------------------------------------")
Write-Host ("Los datos han sido exportados en la siguiente ruta:")
Write-Host ($path)
Write-Host ("---------------------------------------------------")

