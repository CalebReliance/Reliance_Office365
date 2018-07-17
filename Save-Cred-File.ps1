## Description
## Script designed save login credentials to a local XML file for later re-use

## Prerequisites = 0

Clear-Host

write-host -foregroundcolor green "Script started"

## Variables
$FileName = Read-Host -Prompt 'What Tenent is this for' ## Prompt For file Name
$credpath = "C:\RelianceIT\PowerShell\"   ## local file with credentials
$XMLPath = Join-Path -Path $credpath -ChildPath "$FileName.xml" ## File Name and Path that will be saved

## HARD CODE FILE NAME ##
### $credpath = "C:\RelianceIT\PowerShell\tenant.xml"   ## local file with credentials

## Save manually inputed creds to local file
Get-Credential | Export-CliXml  -Path $credpath

write-host -foregroundcolor green "File $XMLPath Created"