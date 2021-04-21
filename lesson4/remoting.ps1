#region Enable
winrm qc
winrm quickconfig

Enable-PSRemoting

#endregion Enable

#region 1 to 1 remoting

Enter-PSSession -computername DC01 

Invoke-Command -computername dc01 -ScriptBlock { 
    get-service bits
    get-service spooler
    get-process
} 

#endregion 1 to 1 remoting

#region 1 to many remoting

invoke-command -ComputerName dc01, srv01 -ScriptBlock { 
    get-service | select-object -first 10
    get-service bits 
}

$myservers = get-adcomputer -filter {name -like *sccm*}
invoke-command -ComputerName $myservers -ScriptBlock { 
    get-service | select-object -first 10
    get-service bits 
}

foreach ($s in $myservers){invoke-comannd -computername $s -scriptblock{do-something} }

invoke-command -ComputerName (get-content c:\scripts\myservers.txt) -ScriptBlock { 
    get-service | select-object -first 10
    get-service bits 
}

Invoke-Command -ComputerName dc01 -ScriptBlock { get-aduser jan } -Credential (Get-Credential)

Invoke-command -computername dc01 -FilePath C:\scripts\remoting\names.ps1

Invoke-Command -ComputerName dc01 -ScriptBlock { get-aduser jan }

#endregion 1 to 1 remoting


#region sessions
$session1 = New-PSSession -ComputerName DC01 -credential jmp.local\admin

Get-PSSession

Enter-PSSession -Session $session1

Invoke-Command -Session $session1 -scriptblock { get-service bits }

$session2 = New-PSSession -ComputerName dc01, srv01 -credential jmp.local\admin

Invoke-Command -Session $session2 -scriptblock {get-service bits }


#endregion sessions


#region Data

Invoke-Command -ComputerName dc01 -scriptBlock `
{ Get-CimInstance -Class Win32_Process } | Select-Object Name, { $_.GetOwner().User }



Invoke-Command -ComputerName dc01 -scriptBlock `
{ Get-CimInstance -Class Win32_Process } | gm

Invoke-Command -ComputerName dc01 -scriptBlock `
{ Get-WmiObject -Class Win32_Process | Select-Object Name, { $_.GetOwner().User } }

#endregion Date

#region copy
Enter-PSSession dc01 

#old way of copying
foreach ($s in $servers) { copy-item \\c:\temp\mydocument.txt \\$s\c$\temp }

$session3 = New-PSSession -ComputerName srv01, dc01

copy-item  "C:\scripts\remoting\mycopy.txt" -Destination "c:\remoting\" -ToSession $session3
#endregion Copy


$a = 6
$b = 19

$a + $b

Invoke-command -computername SRV01 -ScriptBlock{
    $total = $using:a + $using:b
    $total | tee-object -file c:\remoting\math.txt
}
