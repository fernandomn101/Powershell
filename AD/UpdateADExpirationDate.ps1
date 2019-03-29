$csv = Import-Csv '~\Desktop\ADextensions.csv' 

$fecha = [Datetime]::Parse("31/03/2019")

foreach($c in $csv){

    $field = $c.Field
    $filtro = ("cn -eq `"$field`"")    

    Get-ADUser -Filter $filtro -Properties AccountExpirationDate,cn | select cn,AccountExpirationDate,userprincipalname
    Get-ADUser -Filter $filtro | Set-ADAccountExpiration -DateTime $fecha

}

