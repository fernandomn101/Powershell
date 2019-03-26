#Reset password for AD Users named Us00,Us01,Us02,Us03,Us04,Us05,Us06,Us07,Us08,Us09

$contrasenia = "P@ssw0rd123!"

for($i=0; $i -le 9;$i++){
    $user = "Us0"
    Get-ADUser ($user+$i) | Set-ADAccountPassword -Reset -NewPassword (ConvertTo-SecureString -AsPlainText $contrasenia -Force)
    Write-Host("Contraseña cambiada para $user$i") -ForegroundColor Green
}
 