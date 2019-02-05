
#La siguiente linea coge el csv de la ruta y lo guarda en una variable
#cambiar en funcion de donde este el csv
$printers = Import-Csv ~\Desktop\lista.csv

#Insertar el nombre del driver que van a tener la printers
$driver = "Generic / Text Only"

#el foreach coge cada linea del csv guardado y actua con cada una de ellas
ForEach($prin in $printers){

    #guardo el puerto y el nombre de la maquina del csv
    $puerto= $prin.puerto
    $nombre= $prin.nombre

    #Creo el puerto
    Add-PrinterPort $puerto    

    #Creo la impresora, indico el driver, nombre, puerto, el estado compartido y el estado publicado
    Add-Printer -DriverName $driver -Name $nombre -PortName $puerto

    #Establezco el estado compartido y el estado publicado
    Set-Printer -Name $nombre -Published $True -Shared $True

    #imprimo la impresora por la que va
    Write-Host("Añadida $nombre -> $puerto")
}


<# EL CSV DEBE TENER EL SIGUIENTE FORMATO (Primera linea encabezado, desde la segunda las maquinas)

NOMBRE,PUERTO
Impresora1,Puerto1
Impresora2,Puerto2
Impresora3,Puerto3
Impresora3,Puerto4
...,...
Impresoran,Puerton

#>







