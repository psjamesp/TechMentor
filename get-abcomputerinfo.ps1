function get-abcomputerinfo {

    $ComputerName = (Get-CimInstance -ClassName Win32_ComputerSystem).caption
    $Domain = (Get-CimInstance -ClassName Win32_ComputerSystem).domain
    $OperatingSystem = (Get-CimInstance -ClassName Win32_OperatingSystem).caption
    $Model = (Get-CimInstance -ClassName Win32_ComputerSystem).model
    $MachineSN = (Get-CimInstance -ClassName Win32_bios).SerialNumber
    $Version = (Get-CimInstance -ClassName Win32_OperatingSystem).Version
    $BuildNumber = (Get-CimInstance -ClassName Win32_OperatingSystem).BuildNumber
    $OSArchitecture = (Get-CimInstance -ClassName Win32_ComputerSystem).SystemType
    $PowerShellVersion = $PSVersionTable.PSVersion
    $DiskFreeSpace = (Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType=3").FreeSpace

    Write-Host "Your computer name is: $ComputerName" -ForegroundColor Red
    Write-Host "Your domain is: $Domain" -ForegroundColor Red
    Write-Host "Your operating system is: $OperatingSystem" -ForegroundColor Red
    Write-Host "Your computer model is: $Model" -ForegroundColor Red
    Write-Host "Your machine serial number is: $MachineSN" -ForegroundColor Red
    Write-Host "Your OS version is: $Version" -ForegroundColor Red
    Write-Host "Your OS build number is: $BuildNumber" -ForegroundColor Red
    Write-Host "Your OS architecture is: $OSArchitecture" -ForegroundColor Red
    Write-Host "Your PowerShell version is: $PowerSHellVersion" -ForegroundColor Red
    Write-Host "Your disk free space is: $DiskFreeSpace" -ForegroundColor Red
}




function get-computername1 {
    $cn = $env:COMPUTERNAME
    Write-Host "Your computer name is: $cn" -ForegroundColor Red
}


function Get-jmpComputerInfo{
    # ComputerSystem info
    $CompInfo = Get-CimInstance Win32_ComputerSystem 
    # OS info
    $OSInfo = Get-CimInstance Win32_OperatingSystem 
    # Serial No
    $BiosInfo = Get-CimInstance Win32_BIOS 

    $diskfreespace = get-volume -DriveLetter c | Select-Object -ExpandProperty SizeRemaining
    [pscustomobject]@{
        ComputerName = $CompInfo.Name
        Domain = $CompInfo.Domain
        OperatingSystem = $OSInfo.Caption
        Model = $CompInfo.Model
        MachineSN = $BiosInfo.SerialNumber
        Version = $OSInfo.Version
        BuildNumber = $OSInfo.BuildNumber
        OSArchitecture = $OSinfo.OSArchitecture
        PowerShellVersion = $PSVersionTable.psversion
        DiskFreeSpace = "" +[math]::Round($diskfreespace /1GB,2) + " GB"
    }
}