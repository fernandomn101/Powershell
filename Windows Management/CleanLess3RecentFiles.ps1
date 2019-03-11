# just need change the absolutly path
$abspath= 'C:\Users\Administrator\Desktop\foldertoclean'

$folders = Get-ChildItem -Path $abspath | Sort-Object lastwritetime -Descending
for ($i = 3 ; $i -lt $folders.Count ; $i++){
    Write-host($folders[$i].FullName)
    Remove-Item -Path $folders[$i].FullName
    }
