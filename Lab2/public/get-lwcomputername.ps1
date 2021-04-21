function get-computername1 
{ 
    $cn = $env:COMPUTERNAME
    write-host "Your ComputerName is $cn" -ForegroundColor Red 
}