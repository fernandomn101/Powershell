function ahexa($numero){
    $vuelta
    switch($numero){
        10 {$vuelta = 'A'}   
        11 {$vuelta = 'B'} 
        12 {$vuelta = 'C'} 
        13 {$vuelta = 'D'} 
        14 {$vuelta = 'E'} 
        15 {$vuelta = 'F'} 
        default {$vuelta = $numero}
    
    }

    return $vuelta
}


$i = "Hola"

$as = $i.ToCharArray()

foreach ($a in $as){
    
    $a = [Decimal] $a
    
    $uno = ahexa -numero ([int][Math]::Floor($a/16))
    $dos = ahexa -numero ($a%16)

    Write-host ("$uno$dos  ") -NoNewline

}
