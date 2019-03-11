$filtergroup = "Nameofgroup1"

$grupos = Get-ADGroup -Filter {name -like "$filtergroup*"} -Properties Description | Select Name,Description

$usuario1="John.Doe"

foreach($grupo in $grupos){

    Add-ADGroupMember -Identity $grupo.name -Member $usuario1

}