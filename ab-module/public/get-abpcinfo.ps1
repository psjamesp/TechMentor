function get-abpcinfo {
    $osinfo = Get-CimInstance -class win32_operatingsystem

    [PSCustomObject]@{
        Version = $osinfo.Version
        OSArchitecture = $osinfo.OSArchitecture
    }

}