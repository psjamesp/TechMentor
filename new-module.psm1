$computername = $env:COMPUTERNAME

function get-computername1 {
    $cn = $env:COMPUTERNAME
    Write-Host "Your computer name is: $cn" -ForegroundColor Red
}

function get-myservice {
    param (
        $service
    )
    get-service $service | Select-Object name, status
}

function get-myservice1 {
    [CmdletBinding()]
    param (
        $service
    )
    
    begin {
        # import-module post-git
        Write-Host "Script is now starting" -ForegroundColor Green
    }
    
    process {
        $value = get-service $service | Select-Object name, status
        write-host $($value)
    }
    
    end {
        Write-Host "Script is now finished" -ForegroundColor Yellow
    }
}
