$path = "OU=Users,DC=Contoso,DC=com"

Get-ADObject -Filter {Name -like "*"} -SearchBase $path

