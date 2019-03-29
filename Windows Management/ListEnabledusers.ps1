$path =  "OU=Standard Users,OU=Users,OU=Constoso,DC=Contoso,DC=com"

$usuarios = get-aduser -SearchBase $path -Filter {Enabled -eq $true} -Properties enabled | select samaccountname,enabled

$usuarios.Count

$usuarios | export-csv ~\Desktop\usuarios.csv