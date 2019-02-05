#Change the path folder of origin and destination

$origin = Get-ChildItem '~\Desktop\folder_origin'
$destination = '~\Desktop\folder_destination'

#################################################

foreach ($c in $origin){
    
    Copy-Item -Path $c.FullName -Destination $destination -ErrorAction SilentlyContinue
    
    $files = Get-ChildItem $c.FullName

    $destinationsub = $destination+"\"+$c.Name
    #$destinationsub

    foreach($a in $files){
        Copy-Item $a.FullName -Destination $destinationsub -ErrorAction SilentlyContinue
        Remove-Item $a.FullName 
    }
}