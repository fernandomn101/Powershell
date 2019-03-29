$grupo = "Group1Name" 

$check = Get-ADGroupMember $grupo

if ($check -ne $null){

    $miembros = ("Username1","Username2","Username3","Username4")

    Remove-ADGroupMember -Identity $grupo -Members $miembros -Confirm:$true

}else{
    Write-Host("Group not founded.Check variable `$group ")
}



