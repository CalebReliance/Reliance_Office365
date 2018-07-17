﻿## Description
## Script designed to log into the Exchange Online Admin portal

## Prerequisites = 1
## 1. Ensure msonline module installed or updated

## Variables
$savedcreds=$true                      ## false = manually enter creds, True = from file
$Tenant = @(Get-ChildItem C:\relianceit\PowerShell | Out-GridView -Title 'Choose a file' -PassThru)   ## Location of Stored Cred
$credpath = "$Tenant"   ## local file with credentials if required

Clear-Host

write-host -foregroundcolor green "Script started"

## set-executionpolicy remotesigned
## May be required once to allow ability to runs scripts in PowerShell

## ensure that install-module msonline has been run
## ensure that update-module msonline has been run to get latest module
import-module msonline
write-host -foregroundcolor green "MSOnline module loaded"

## Get tenant login credentials
if ($savedcreds) {
    ## Get creds from local file
    $cred =import-clixml -path c:\relianceit\Powershell\$credpath
}
else {
    ## Get creds manually
    $cred=get-credential 
}

## Connect to Office 365 admin service
connect-msolservice -credential $cred
write-host -foregroundcolor green "Now connected to Office 365 Admin service"

## Start Exchange Online session
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/?proxyMethod=RPS -Credential $Cred -Authentication Basic -AllowRedirection
import-PSSession $Session
write-host -foregroundcolor green "Now connected to Exchange Online services"