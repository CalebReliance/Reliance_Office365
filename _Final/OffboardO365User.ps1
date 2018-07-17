#Login to Customer Portal
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
$CRED = Get-Credential
$SESSION = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $CRED -Authentication Basic -AllowRedirection
Import-PSSession $SESSION
Connect-MsolService -Credential $CRED

#Ask for User you are disabling
[void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
$title = 'User'
$msg   = 'Enter Email of User to Disable:'
$user = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)

#Convert to a Shared Mailbox
Get-Mailbox -identity $user | set-mailbox -type "Shared"
Set-Mailbox -Identity $user -HiddenFromAddressListsEnabled $true

#Remove Licence From User Account
$userLicense = Get-MsolUser -UserPrincipalName $user
Set-MsolUserLicense -UserPrincipalName $user -RemoveLicenses $userLicense.Licenses.accountskuid