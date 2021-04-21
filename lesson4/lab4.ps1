
function Get-jmpComputerInfo {
    # ComputerSystem info
    $CompInfo = Get-CimInstance Win32_ComputerSystem 
    # OS info
    $OSInfo = Get-CimInstance Win32_OperatingSystem 
    # Serial No
    $BiosInfo = Get-CimInstance Win32_BIOS 

    $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
    [pscustomobject]@{
        ComputerName      = $CompInfo.Name
        Domain            = $CompInfo.Domain
        OperatingSystem   = $OSInfo.Caption
        Model             = $CompInfo.Model
        MachineSN         = $BiosInfo.SerialNumber
        Version           = $OSInfo.caption
        BuildNumber       = $OSInfo.version
        OSArchitecture    = $OSinfo.OSArchitecture
        PowerShellVersion = $PSVersionTable.psversion
        DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
    }
}

function Get-jmpComputerInfo {
    # ComputerSystem info
    $CompInfo = Get-CimInstance Win32_ComputerSystem -ComputerName DC01
    # OS info
    $OSInfo = Get-CimInstance Win32_OperatingSystem -ComputerName DC01
    # Serial No
    $BiosInfo = Get-CimInstance Win32_BIOS -ComputerName DC01

    $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
    [pscustomobject]@{
        ComputerName      = $CompInfo.Name
        Domain            = $CompInfo.Domain
        OperatingSystem   = $OSInfo.Caption
        Model             = $CompInfo.Model
        MachineSN         = $BiosInfo.SerialNumber
        Version           = $OSInfo.caption
        BuildNumber       = $OSInfo.version
        OSArchitecture    = $OSinfo.OSArchitecture
        PowerShellVersion = $PSVersionTable.psversion
        DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
    }
}

Get-jmpComputerInfo


function Get-jmpComputerInfo {
    [CmdletBinding()]
    param (
        $ComputerName
    )
    # ComputerSystem info
    $CompInfo = Get-CimInstance Win32_ComputerSystem -ComputerName $ComputerName
    # OS info
    $OSInfo = Get-CimInstance Win32_OperatingSystem -ComputerName $ComputerName
    # Serial No
    $BiosInfo = Get-CimInstance Win32_BIOS -ComputerName $ComputerName

    #$diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
    [pscustomobject]@{
        ComputerName      = $CompInfo.Name
        Domain            = $CompInfo.Domain
        OperatingSystem   = $OSInfo.Caption
        Model             = $CompInfo.Model
        MachineSN         = $BiosInfo.SerialNumber
        Version           = $OSInfo.caption
        BuildNumber       = $OSInfo.version
        OSArchitecture    = $OSinfo.OSArchitecture
        PowerShellVersion = $PSVersionTable.psversion
        #DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
    }
}

Get-jmpComputerInfo -ComputerName SRV01

Get-jmpComputerInfo -ComputerName SRV01, DC01

function Get-jmpComputerInfo {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]$ComputerName
    )
    foreach ($c in $ComputerName) {
        # ComputerSystem info
        $CompInfo = Get-CimInstance Win32_ComputerSystem -ComputerName $c
        # OS info
        $OSInfo = Get-CimInstance Win32_OperatingSystem -ComputerName $c
        # Serial No
        $BiosInfo = Get-CimInstance Win32_BIOS -ComputerName $c

        $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
        [pscustomobject]@{
            ComputerName      = $CompInfo.Name
            Domain            = $CompInfo.Domain
            OperatingSystem   = $OSInfo.Caption
            Model             = $CompInfo.Model
            MachineSN         = $BiosInfo.SerialNumber
            Version           = $OSInfo.caption
            BuildNumber       = $OSInfo.version
            OSArchitecture    = $OSinfo.OSArchitecture
            PowerShellVersion = $PSVersionTable.psversion
            DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
        }
    }
}

Get-jmpComputerInfo -ComputerName SRV01, DC01

function Get-jmpComputerInfo {
    [CmdletBinding()]

    # ComputerSystem info
    $CompInfo = Get-CimInstance Win32_ComputerSystem 
    # OS info
    $OSInfo = Get-CimInstance Win32_OperatingSystem
    # Serial No
    $BiosInfo = Get-CimInstance Win32_BIOS

    $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
    [pscustomobject]@{
        ComputerName      = $CompInfo.Name
        Domain            = $CompInfo.Domain
        OperatingSystem   = $OSInfo.Caption
        Model             = $CompInfo.Model
        MachineSN         = $BiosInfo.SerialNumber
        Version           = $OSInfo.caption
        BuildNumber       = $OSInfo.version
        OSArchitecture    = $OSinfo.OSArchitecture
        PowerShellVersion = $PSVersionTable.psversion
        DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
        
    }
}

invoke-command -computername dc01 -scriptblock { Get-jmpComputerInfo }


invoke-command -computername dc01 -scriptblock { 
    function Get-jmpComputerInfo {
        [CmdletBinding()]

        # ComputerSystem info
        $CompInfo = Get-CimInstance Win32_ComputerSystem 
        # OS info
        $OSInfo = Get-CimInstance Win32_OperatingSystem
        # Serial No
        $BiosInfo = Get-CimInstance Win32_BIOS

        $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
        [pscustomobject]@{
            ComputerName      = $CompInfo.Name
            Domain            = $CompInfo.Domain
            OperatingSystem   = $OSInfo.Caption
            Model             = $CompInfo.Model
            MachineSN         = $BiosInfo.SerialNumber
            Version           = $OSInfo.caption
            BuildNumber       = $OSInfo.version
            OSArchitecture    = $OSinfo.OSArchitecture
            PowerShellVersion = $PSVersionTable.psversion
            DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
        
        }
    }
    Get-jmpComputerInfo
}


invoke-command -computername dc01, srv01, localhost -scriptblock { function Get-jmpComputerInfo {
        [CmdletBinding()]

        # ComputerSystem info
        $CompInfo = Get-CimInstance Win32_ComputerSystem 
        # OS info
        $OSInfo = Get-CimInstance Win32_OperatingSystem
        # Serial No
        $BiosInfo = Get-CimInstance Win32_BIOS

        $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
        [pscustomobject]@{
            ComputerName      = $CompInfo.Name
            Domain            = $CompInfo.Domain
            OperatingSystem   = $OSInfo.Caption
            Model             = $CompInfo.Model
            MachineSN         = $BiosInfo.SerialNumber
            Version           = $OSInfo.caption
            BuildNumber       = $OSInfo.version
            OSArchitecture    = $OSinfo.OSArchitecture
            PowerShellVersion = $PSVersionTable.psversion
            DiskFreeSpace     = "" + [math]::Round($diskfreespace / 1GB, 2) + " GB"
    
        }
    }Get-jmpComputerInfo
}
