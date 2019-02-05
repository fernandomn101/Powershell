#This script removes all the files except the three newest

#Just need change the absolutly path to clean

$abspath= 'C:\Users\Administrador.WIN-K6N9GP6TSSS\Desktop\carpeta para borrar'

$folders = Get-ChildItem -Path $abspath | Sort-Object lastwritetime -Descending
for ($i = 3 ; $i -lt $folders.Count ; $i++){
    Write-host($folders[$i].FullName)
    Remove-Item -Path $folders[$i].FullName
    }
