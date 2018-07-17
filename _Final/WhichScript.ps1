## Description
## Script designed to ask whioch PowerShell Scipt you would like to run

## Variables
$Script = @(Get-ChildItem "D:\OneDrive Data\OneDrive - Reliance Technology\Microsoft\Office365\Scripts\Custom Scripts" | Out-GridView -Title 'Choose a file' -PassThru)
$RunScript = ".\$Script"   ## local file with credentials if required

Clear-Host

write-host -foregroundcolor green "Select Script"

Invoke-Expression $RunScript
