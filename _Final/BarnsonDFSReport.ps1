#Veriables
$DubboServer = "svrdc01-dubb"
$BulkHillsServer = "svrdc01-bhill"
$BathServer = "svrdc01-bath"
$MudgServer = "svrdc01-mudg"


# Function to choose DFS Report Site option
function BarnsonDFSReport
{
    param
    (
        [string]$BarnsonDFSReportTitle = 'Barnson DFS Report'
    )

    Clear-Host
    Write-Host '================' $BarnsonDFSReportTitle '================'
    Write-Host '1: Dubbo to Bulk-Hills'
    Write-Host '2: Dubbo to Baturst'
    Write-Host '3: Dubbo to Mudgee'
    Write-Host '4: Bulk-Hills to Dubbo'
    Write-Host '5: Bulk-Hills to Baturst'
    Write-Host '6: Bulk-Hills to Mudgee'
    Write-Host '7: Baturst to Bulk-Hills'
    Write-Host '8: Baturst to Dubbo'
    Write-Host '9: Baturst to Mudgee'
    Write-Host '10: Mudgee to Bulk-Hills'
    Write-Host '11: Mudgee to Dubbo'
    Write-Host '12: Mudgee to Bathurst'
    Write-Host '13: All Sites'  
    Write-Host 'q: Quit'

    $Input = Read-Host 'Please select an option'
    If ($Input -eq '1')
    {
        DubtoBulk
    }
    ElseIf ($Input -eq '2')
    {
        DubotoBath
    }
    ElseIf ($Input -eq '3')
    {
        DubtoMudg    
    }
    ElseIf ($Input -eq '4')
    {
        BulktoDubo
    }
    ElseIf ($Input -eq '5')
    {
        BulktoBath
    }
    ElseIf ($Input -eq '6')
    {
        BulktoMudg
    }
    ElseIf ($Input -eq '7')
    {
        BathtoBulk
    }
    ElseIf ($Input -eq '8')
    {
        BathtoDubo
    }
    ElseIf ($Input -eq '9')
    {
        BathtoMudg    
    }
    ElseIf ($Input -eq '10')
    {
        MudgtoBulk
    }
    ElseIf ($Input -eq '11')
    {
        MudgtoDubo
    }
    ElseIf ($Input -eq '12')
    {
        MudgtoBath
    }
    ElseIf ($Input -eq '13')
    {
        AllSites
    }
    ElseIf ($Input -eq 'q')
    {
        Exit
    }
    Else
    {
        Write-Host 'Invalid selection'
        BarnsonDFSReport
    }
}

# Function to run Dubbo to Bulk-Hills Report
function DubtoBulk
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        DubtoBulk
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        DubtoBulk
    }
}

# Function to run Dubbo to Bathurst Report
function DubotoBath
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $BathServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        DubotoBath
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        DubotoBath
    }
}

# Function to run Dubbo to Mudgee Report
function DubtoMudg
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $MudgServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        DubtoMudg
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        DubtoMudg
    }
}

# Function to run Bulk-Hills to Dubbo Report
function BulktoDubo
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $DubboServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BulktoDubo
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BulktoDubo
    }
}

# Function to run Bulk-Hills to Bathurst Report
function BulktoBath
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $BathServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BulktoBath
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BulktoBath
    }
}

# Function to run Bulk-Hills to Mudgee Report
function BulktoMudg
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $MudgServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BulktoMudg
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BulktoMudg
    }
}

# Function to run Bathurst to Bulk-Hills Report
function BathtoBulk
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BathtoBulk
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BathtoBulk
    }
}

# Function to run Bathurst to Dubbo Report
function BathtoDubo
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $DubboServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BathtoDubo
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BathtoDubo
    }
}

# Function to run Bathurst to Mudgee Report
function BathtoMudg
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $MudgServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        BathtoMudg
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        BathtoMudg
    }
}

# Function to run Mudgee to Bulk-Hills Report
function MudgtoBulk
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        MudgtoBulk
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        MudgtoBulk
    }
}

# Function to run Mudgee to Dubbo Report
function MudgtoDubo
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $DubboServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        MudgtoDubo
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        MudgtoDubo
    }
}

# Function to run Mudgee to Dubbo Report
function MudgtoBath
{
    write-host -foregroundcolor green "Report in Process"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $BathServer -verbose | Out-Null
    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        MudgtoBath
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        MudgtoBath
    }
}

# Function to run All Site Report
function AllSites
{
    Clear-Host
    write-host -foregroundcolor green "Dubbo to Bulk-Hills"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null

    write-host -foregroundcolor green "Dubbo to Baturst"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $BathServer -verbose | Out-Null

    write-host -foregroundcolor green "Dubbo to Mudgee"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $DubboServer -DestinationComputerName $MudgServer -verbose | Out-Null

    write-host -foregroundcolor green "Bulk-Hills to Dubbo"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $DubboServer -verbose | Out-Null

    write-host -foregroundcolor green "Bulk-Hills to Baturst"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $BathServer -verbose | Out-Null

    write-host -foregroundcolor green "Bulk-Hills to Mudgee"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BulkHillsServer -DestinationComputerName $MudgServer -verbose | Out-Null

    write-host -foregroundcolor green "Baturst to Bulk-Hills"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null

    write-host -foregroundcolor green "Baturst to Dubbo"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $DubboServer -verbose | Out-Null

    write-host -foregroundcolor green "Baturst to Mudgee"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $BathServer -DestinationComputerName $MudgServer -verbose | Out-Null

    write-host -foregroundcolor green "Mudgee to Bulk-Hills"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $BulkHillsServer -verbose | Out-Null

    write-host -foregroundcolor green "Mudgee to Dubbo"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $DubboServer -verbose | Out-Null

    write-host -foregroundcolor green "Mudgee to Bathurst"
    Get-DfsrBacklog -GroupName Jobs -FolderName * -SourceComputerName $MudgServer -DestinationComputerName $BathServer -verbose | Out-Null

    $Input = Read-Host 'Would you like to run the sync again (Y\N)?'
    If ($Input -eq 'y')
    {
        AllSites
    }
    ElseIf ($Input -eq 'n')
    {
        BarnsonDFSReport
    }
    Else
    {
        Write-Host 'Invalid selection'
        AllSites
    }
}


# Start of program
Clear-Host
BarnsonDFSReport