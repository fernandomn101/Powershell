$manager = Get-ADUser JohnDoe

Get-ADUser -Filter * -Properties manager | Where-Object -FilterScript {$_.Manager -eq $manager}