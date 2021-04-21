$computername = $env:COMPUTERNAME

function get-computername1 
{ 
    $cn = $env:COMPUTERNAME
    write-host "Your ComputerName is $cn" -ForegroundColor Red 
}

"Today's Date is " + (Get-Date)
Write-Host (get-computername1)
Get-CimInstance -Classname Win32_BIOS

function get-myservice 
{
    [CmdletBinding()]
    param (
        $service
    )

    begin {
        import-module posh-git
        Write-Host "Script is now starting" -ForegroundColor Green 
    }

    process {
        $value = get-service $service | Select-Object name,Status
    }

    end {
        Write-Host "Script has finished executing" -ForegroundColor Yellow
    }
    # Modify [CmdletBinding()] to [CmdletBinding(SupportsShouldProcess=$true)]
}
