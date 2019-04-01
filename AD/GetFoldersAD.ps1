


function getADfolders(){
    $lista = @()
    $objetos = Get-ADObject -SearchBase "OU=Organizational Unit1,DC=Contoso,DC=com"  -Filter {ObjectClass -like "organizationalunit"} -Properties CanonicalName| select CanonicalName | Sort-Object CanonicalName | Select-Object -Skip 1
    foreach($objeto in $objetos){
        $lista+= $objeto.CanonicalName.Replace("Contoso.com/Organizational Unit1/","") 
    }
    return $lista
}



$carpetas = getADfolders