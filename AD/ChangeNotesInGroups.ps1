##Introducir el filtro de los grupos en los que actuar
$filtro = "Group.Filter*"

##Introducir el nuevo valor para el campo a actualizar
$nuevovalor = "This is the new value for notes field in the AD Group"

#Obtengo todos los grupos del AD que cumplen el $filtro. De los grupos obtengo nombre descripcion e info(Nombre real del campo notas) y los almaceno en una variable
$grupos = Get-ADGroup -Filter {name -like $filtro} -Properties Description,info | Select Name,Description,info

#El bucle recorre cada grupo y actualiza (replace) el campo notas (info) con el texto indicado
foreach($group in $grupos){
    Set-ADGroup $group.Name  -Replace @{info = $nuevovalor}
}

