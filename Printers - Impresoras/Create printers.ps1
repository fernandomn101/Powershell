<# EL CSV DEBE TENER EL SIGUIENTE FORMATO (Primera linea encabezado, desde la segunda las maquinas)
   THE CSV FILE MUST HAVE THE FOLLOWING FORMAT (First line header must be literaly like below, from second line servers)
NOMBRE,PUERTO
Impresora1Nombre,10.0.0.2
Printer2Name,10.0.0.3
Impresora3Nombre,10.0.0.4
Printer4Name,10.0.0.5
...,...
Impresoran,Puerton
#>

##Server where the printer will be created
$servidor = "ESBCNWSPRN26"

cd $PSScriptRoot
#La siguiente linea coge el csv de la ruta y lo guarda en una variable
#cambiar en funcion de donde este el csv
$printers = Import-Csv .\lista.csv

#Insertar el nombre del driver que van a tener la printers
$driver = "Generic / Text Only"

#el foreach coge cada linea del csv guardado y actua con cada una de ellas
ForEach($prin in $printers){

    #guardo el puerto y el nombre de la maquina del csv
    $puerto= $prin.puerto
    $nombre= $prin.nombre

    #Creo el puerto
    Add-PrinterPort -ComputerName $servidor  $puerto -PrinterHostAddress $puerto

    #Creo la impresora, indico el driver, nombre, puerto, el estado compartido y el estado publicado
    Add-Printer -ComputerName $servidor -DriverName $driver -Name $nombre -PortName $puerto

    #Establezco el estado compartido y el estado publicado
    Set-Printer -ComputerName $servidor -Name $nombre -Published $True -Shared $True

    #imprimo la impresora por la que va
    Write-Host("Añadida $nombre -> $puerto")
}









