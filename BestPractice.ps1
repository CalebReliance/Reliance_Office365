
#### Enable legal hold mailboxes for all users
write-host -foregroundcolor green "Enabling Legal Hold on All Mailboxes"
Get-mailbox | set-mailbox -litigationholdenabled $true
write-host -foregroundcolor green "Legal Hold Enabled for all Eligable Mailboxes"

#### Enable global audit logging
write-host -foregroundcolor green "Enabling Global Audit Logging"
Get-Mailbox -ResultSize Unlimited -Filter {RecipientTypeDetails -eq "UserMailbox" -or RecipientTypeDetails -eq "SharedMailbox" -or RecipientTypeDetails -eq "RoomMailbox" -or RecipientTypeDetails -eq "DiscoveryMailbox"} | Set-Mailbox -AuditEnabled $true -AuditLogAgeLimit 180 -AuditAdmin Update, MoveToDeletedItems, SoftDelete, HardDelete, SendAs, SendOnBehalf, Create, UpdateFolderPermission -AuditDelegate Update, SoftDelete, HardDelete, SendAs, Create, UpdateFolderPermissions, MoveToDeletedItems, SendOnBehalf -AuditOwner UpdateFolderPermission, MailboxLogin, Create, SoftDelete, HardDelete, Update, MoveToDeletedItems 
write-host -foregroundcolor green "Global Audit Logging Enabled"

#### Enable 180 Day Audit log
write-host -foregroundcolor green "Enabling 180 Day Audit log"
Get-Mailbox -ResultSize Unlimited | Set-Mailbox -AuditLogAgeLimit 180
write-host -foregroundcolor green "180 Day Audit log Enabled"

#### Set all mailboxes to maximum 30 days deleted items 
write-host -foregroundcolor green "Changing All Mailboxes to Maximum 30 Days Deleted Items"
Get-mailbox | set-mailbox -retaindeleteditemsfor 30
write-host -foregroundcolor green "30 Days Deleted Items Enabled on All Mailboxes"

#### Enable auto-expanding archiving for organisation
write-host -foregroundcolor green "Enabling Auto-Expanding Archiving for Organisation"
Set-OrganizationConfig -AutoExpandingArchive
write-host -foregroundcolor green "Auto-Expanding Archiving Enabled for Organisation"

#### To set all mailboxes to English (Australia) and Sydney EST timezone
write-host -foregroundcolor green "Setting All Mailboxes to English (Australia) and Sydney EST Timezone"
get-mailbox -ResultSize unlimited | Set-MailboxRegionalConfiguration -Language 3081 -TimeZone "AUS Eastern Standard Time"
write-host -foregroundcolor green "All Mailboxes Set to English (Australia) and Sydney EST Timezone"

#### Enable modern authentication in Exchange Online
write-host -foregroundcolor green "Enabling Modern Authentication in Exchange Online"
Set-OrganizationConfig -OAuth2ClientProfileEnabled $true
write-host -foregroundcolor green "Modern Authentication Enabled in Exchange Online"