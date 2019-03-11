$path = 'Registry::HKey_Local_Machine\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
$items = Get-ItemProperty -path $path
Foreach ($item in $items) {
    $objUser = New-Object System.Security.Principal.SecurityIdentifier($item.PSChildName)
    $objName = $objUser.Translate([System.Security.Principal.NTAccount])
    $item.PSChildName = $objName.value
}
$items.pschildname