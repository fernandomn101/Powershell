cls
$outfile = "~\Desktop\discos.csv"

$discos = get-volume | select *| Sort-Object filesystemlabel
foreach($dis in $discos){
    $fila = ($dis.FileSystemLabel+","+","+","+","+","+","+$dis.FileSystem+","+([Math]::Round($dis.SizeRemaining /1GB,2))+"GB,"+([Math]::Round($dis.Size /1GB,2))+"GB,255,"+","+"1,"+","+$dis.ObjectId+","+((($dis.ObjectId.Replace('\\?\Volume{','')).replace('}\',''))))
    $fila | Out-File $outfile -Encoding utf8 -Append

}
