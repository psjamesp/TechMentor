function get-computername1 {
    $cn = $env:COMPUTERNAME
    Write-Host "Your computer name is: $cn" -ForegroundColor Red
}