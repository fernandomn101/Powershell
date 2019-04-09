#With an IP Address given, the script get:
#   Host by IP Address given
#   Host/Hosts founded by ServerName (Shows if an hostname have more than one IP Address)   
#   If one IP address have more than one IP Address in DNS
        

$ip = "10.0.0.10"
$segdir   = [System.Net.Dns]::GetHostByAddress($ip)
$segname  = [System.Net.Dns]::GetHostByName($segdir.HostName)
$segname2 = [System.Net.Dns]::GetHostByName($segdir.Aliases)
$segdir
$segname
$segname2
