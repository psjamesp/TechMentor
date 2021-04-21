function Get-L4ComputerName {
    Get-CimInstance -Classname Win32_ComputerSystem | Select-Object Name
}

function Get-L4Processes {
    Get-Process | Sort-Object -Descending -Property CPU | Select-Object -First 5
}

function Get-bitsService {
    $bitsService = "bits"
    $bitsrunning = Get-Service bits
    if ($bitsrunning.Status -eq "Running") {
        Stop-Service bits -Force -NoWait
    }
    if ($bitsService.Status -eq "Stopped") {
        Start-Service -Name bits -Force -NoWait
    }
}

function Get-ServicesStartingWithS
{
    Get-Service | Where-Object {$_.Name -like "s*"}
}

function Get-Lab5Info {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]
        $ComputerName)

    Invoke-Command -ComputerName $ComputerName -ScriptBlock {
        Get-Service | Where-Object {$_.Name -like "s*"} 
        Get-Process | Sort-Object -Descending -Property CPU | Select-Object -First 5
    }
    $cred = Get-Credential
    $session1 = New-PSSession -ComputerName $ComputerName -Credential $cred
    Invoke-Command -Session $session1 -ScriptBlock {
        $bitsService = "bits"
        $bitsrunning = Get-Service $bitsService
        if ($bitsrunning.Status -eq "Running") {
            Stop-Service -Name bits -Force -NoWait
            Start-Sleep -Seconds 20
        }
        Get-Service bits
        $bitsrunning = Get-Service $bitsService
        if ($bitsrunning.Status -eq "Stopped") {
            Start-Service -Name bits
            Start-Sleep -Seconds 20
        }
        Get-Service bits
    }
    Get-PSSession | Remove-PSSession

}