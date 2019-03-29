$usuario = "jdoe"

Write-Host("")
Write-Host("---------------------------")
Write-Host("Buscando grupos en Exchange") -ForegroundColor Green
Write-Host("---------------------------")

if($mailboxes -eq $null){
    $mailboxes = Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails Sharedmailbox,UserMailbox | select alias
}

Write-Host("")
Write-Host("---------------------------")
Write-Host("Encontrados "+$mailboxes.count+" grupos") -ForegroundColor DarkYellow
Write-Host("---------------------------")

Write-Host("")
Write-Host("---------------------------------------")
Write-Host("Buscando el usuario en todos los grupos") -ForegroundColor Green
Write-Host("---------------------------------------")

$i=0
$porcentaje = 0
foreach($g in $mailboxes){

    $porcentaje= [int](($i/$mailboxes.Count)*100)
    Write-Progress -Activity "Buscando usuario $usuario" -Status ("Buscando en "+$g.Alias+" ...........$porcentaje%") -PercentComplete $porcentaje
    Get-MailboxPermission -identity $g.Alias -user $usuario
    $i++

}