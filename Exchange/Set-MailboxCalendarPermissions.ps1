$mailbox = "Meeting room xx:\Calendar"
$user = "John.Doe@contoso.com"

#Get calendar permissions from a mailbox
Get-MailboxFolderPermission    -Identity $mailbox

#Remove user "calendar" permission from a mailbox
Remove-MailboxFolderPermission -Identity $mailbox -User $user

#Add editor permissions in a mailbox
Add-MailboxFolderPermission    -Identity $mailbox -User $user -AccessRights Editor

#add owner permissions in a mailbox
Add-MailboxFolderPermission    -Identity $mailbox -User $user -AccessRights Owner