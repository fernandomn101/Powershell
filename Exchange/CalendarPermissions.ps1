$usuario = "john.doe@contoso.com"

$user = Get-Mailbox -Identity $usuario | select userprincipalname 

########filtrar los calendarios que se necesiten #############
#por alias
#$rooms = Get-Mailbox -Filter {alias -like "roomforcalendars*"} | Sort-Object alias | select userprincipalname
#por nombre
#$rooms = Get-Mailbox -Filter {(name -like "*the meeting rooms*") -and (name -notlike "*notlikeclause*")} | Sort-Object alias | select userprincipalname
#manualmente
$rooms = @("roomforcalendars1@contoso.com","roomforcalendars2@contoso.com","roomforcalendars3@contoso.com","roomforcalendars4@contoso.com",
"roomforcalendars5@contoso.com","roomforcalendars6@contoso.com","roomforcalendars7@contoso.com")

foreach ($cal in $rooms){
    $calendario = $cal+":\Calendar"
    Add-MailboxFolderPermission -identity $calendario –User $user.UserPrincipalName –Accessrights Editor
}

