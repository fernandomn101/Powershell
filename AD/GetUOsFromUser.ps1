$user = "John Doe"

$Username = Get-ADUser -Filter {name -like "$user*"} | select samaccountname

Get-ADPrincipalGroupMembership $Username.samaccountname | select name
