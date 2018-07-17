##### Activate Windows with Firmware-Embedded Key #####
##### https://social.technet.microsoft.com/Forums/en-US/47cfebb8-97f7-41dd-a627-3b0b8c4b118f/activating-windows-via-powershell?forum=winserverpowershell #####
##### Getting serial key from Bios ####
$service = get-wmiObject -query 'select * from SoftwareLicensingService'

# Getting activation object#

$service.OA3xOriginalProductKey

##### Install product key and activate ####
$key=$service.OA3xOriginalProductKey
$service.InstallProductKey($key)