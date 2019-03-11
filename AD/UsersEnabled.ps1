$rutabuenos= "C:\Users\JohnDoe\Desktop\Usersoutputcorrect.csv"
$rutamalos = "C:\Users\JohnDoe\Desktop\usersoutputnotfound.csv"

Remove-Item -Path $rutabuenos  -ErrorAction SilentlyContinue
Remove-item -Path $rutamalos   -ErrorAction SilentlyContinue

$csv =  import-csv 'C:\Users\JohnDoe\Desktop\usersinput.csv' -Delimiter ','

foreach($fila in $csv){
    
    try{
        Get-ADUser -Identity $fila.User_ID  -Properties enabled -ErrorAction Stop | select name,samaccountname,enabled | export-csv $rutabuenos -Delimiter ';' -Encoding UTF8 -Append -NoTypeInformation
        Write-Host($fila.User_ID + "-> founded") 
    }catch{
        $salida = ($fila.User_ID+" -> user not found") 
        $salida | Out-File $rutamalos -Encoding utf8 -Append
        write-host $salida -ForegroundColor Yellow  
    }

}