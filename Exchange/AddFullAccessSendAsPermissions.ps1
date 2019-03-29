<# 
This script allow fullaccess and sandas permisions in a mailbox to all the users which are member of the given distribution lists
#>


#Mailbox in which add permissions
$mailboxforadd = "distributionlist@contoso.com"

#Mailbox/es from where obtain the members
$groups = @("group1@contoso.com","group2@contoso.com")


###############################
##### Script starts below #####
###############################

$edit = Get-Mailbox $mailboxforadd

foreach($group in $groups){
    
    $users = Get-DistributionGroupMember $group
    
    foreach($user in $users){
        
        Add-MailboxPermission -identity $edit.Name -user $user.Name -AccessRights FullAccess
        Add-RecipientPermission $edit.Name -AccessRights SendAs -Trustee $user.Name

    }
}







