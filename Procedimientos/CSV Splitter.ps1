#Take a csv an split it in all the parts as you want#

$path = 'C:\Users\Fmohinoadmin\Desktop\IIS\remove filenames\'    #path of the folder
$filename = 'iisfilenamesinfo.csv'  # name of the file
$numberofsplitsrow = 10             # number of splits

#####################################################


$csv = Import-Csv ($path+$filename)
$splits = ($csv.count/$numberofsplitsrow)

$row = 0
$numberofsplitsrow = 0

while ($row -lt $csv.Count){
    for($i = 0;$i -lt $splits ; $i++){
        if ($row -lt $csv.Count){
            $csv[$row] | Export-Csv -Path ($path+$numberofsplitsrow+$filename) -NoTypeInformation -Append
            $row++
        }
    }
    $numberofsplitsrow++
}



