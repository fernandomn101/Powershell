function semanademes($ordinal,$nombre){
    $mescompleto = @()
    $p = Get-Date | select Month, Year
    $dias = [System.DateTime]::DaysInMonth($p.Year,$p.Month)
    for($i=1 ; $i -le $dias; $i++){
        $mescompleto += Get-Date -Day $i
    }
    $conjunto = $mescompleto | select datetime,day,dayofweek | Group-Object dayofweek | Where-Object {$_.Name -eq $nombre} | select group
    $diapedido = $conjunto.Group | select -First $ordinal | select -Last 1
    $diapedido = $diapedido.DateTime
    return $diapedido
}

function semanadeotromes($ordinal,$nombre){
    $mes = 3
    $anio = 2019
    $mescompleto = @()
    $p = Get-Date -Month $mes -Year $anio | select Month, Year
    $dias = [System.DateTime]::DaysInMonth($p.Year,$p.Month)
    for($i=1 ; $i -le $dias; $i++){
    
        $mescompleto += Get-Date -Day $i -Month $mes -Year $anio
        
    }

    $conjunto = $mescompleto | select datetime,day,dayofweek | Group-Object dayofweek | Where-Object {$_.Name -eq $nombre} | select group
    $diapedido = $conjunto.Group | select -First $ordinal | select -Last 1
    $diapedido = $diapedido.DateTime
    return $diapedido
}

function mesreferencia($dia0){
    $w2tue = Get-Date $dia0
    $w2thu = (Get-Date $w2tue).AddDays(2)
    $w3tue = (Get-Date $w2tue).AddDays(7)
    $w3thu = (Get-Date $w2tue).AddDays(9)
    $w4tue = (Get-Date $w2tue).AddDays(14)
    $w4thu = (Get-Date $w2tue).AddDays(16)
    $w1tue = (Get-Date $w2tue).AddDays(21)
    $w1thu = (Get-Date $w2tue).AddDays(23)
    return ($w2tue,$w2thu,$w3tue,$w3thu,$w4tue,$w4thu,$w1tue,$w1thu)
}

$diaref = (semanademes 2 "Tuesday")
$refmonth =  mesreferencia $diaref

$hoy = Get-Date

foreach($fecha in $refmonth){
    
    #Si el dia de hoy coincide con algun dia de referencia, entonces realizar acciones 
    #Coger los servidores de ese dia, enviar correos a infrastructure operations
    if($hoy.Date.Equals($fecha.Date)){
        Write-Host ("Hoy es "+$fecha.DateTime)    
    }
}

#reference days
$refmonth


