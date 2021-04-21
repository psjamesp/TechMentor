Enter-PSSession -ComputerName MF1500D

Invoke-Command -ComputerName MF1500D -ScriptBlock {$cn = $env:COMPUTERNAME; write-host "Your ComputerName is $cn" -ForegroundColor Red}

Invoke-Command -ComputerName MF1500D, MF1498D -ScriptBlock {$cn = $env:COMPUTERNAME; write-host "Your ComputerName is $cn" -ForegroundColor Red}

Get-Help Invoke-Command

Invoke-Command -ComputerName MF1500D, MF1498D -ScriptBlock {$env:COMPUTERNAME}

Invoke-Command -ComputerName MF1500D -ScriptBlock{
    Get-ChildItem C:\remoting
    gci C:\
    Get-Service Spooler
}

Invoke-Command -ComputerName MF1500D,MF1498D -ScriptBlock {
    Get-Service | Select-Object -First 5
    Get-Service BITS
}

$myservers = Get-ADComputer -Filter {name -like MF}

Invoke-Command -ComputerName <NetworkNameofPC> -FilePath <FilePathofPowerShellScripttoRun>

$cred = Get-Credential

$session1 = New-PSSession -ComputerName MF1500D -Credential $cred

Get-PSSession

Enter-PSSession -Session $session1

Get-PSSession | Remove-PSSession

Invoke-Command -Session $session1 -ScriptBlock {
    Get-Service bits
}









Function Test-IsAdmin

{

 <#

    .Synopsis

        Tests if the user is an administrator

    .Description

        Returns true if a user is an administrator, false if the user is not an administrator       

    .Example

        Test-IsAdmin

    #>

 $identity = [Security.Principal.WindowsIdentity]::GetCurrent()

 $principal = New-Object Security.Principal.WindowsPrincipal $identity

 $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

}

Invoke-Command -ComputerName MF1500D -ScriptBlock {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()

    $principal = New-Object Security.Principal.WindowsPrincipal $identity
   
    $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

Invoke-Command -ComputerName MF1500D -ScriptBlock {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()

    $principal = New-Object Security.Principal.WindowsPrincipal $identity
   
    $principal.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

Invoke-Command -ComputerName MFHC1309L -ScriptBlock{
    function Get-testpcinfo{
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
            Version = $OSInfo.caption
            BuildNumber = $OSInfo.version
            OSArchitecture = $OSinfo.OSArchitecture
            PowerShellVersion = $PSVersionTable.psversion
            DiskFreeSpace = "" +[math]::Round($diskfreespace /1GB,2) + " GB"
        }
    }
    Get-testpcinfo
}