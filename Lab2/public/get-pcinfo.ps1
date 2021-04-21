function get-lwcomputerinfo 
{
    $osinfo = Get-CimInstance -class Win32_OperatingSystem

    [PSCustomObject]@{
        Version        = $osinfo.Version
        OSArchitecture = $osinfo.Architecture
    }
}

get-lwcomputerinfo
