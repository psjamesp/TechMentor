## Pester Labs

1) Add new planets
2) Check for Strings
3) Check for Integers
4) Does c:\temp\test.ps1 exist



<#BeforeAll { 
    . $PSScriptRoot/Get-Planet.ps1
}
#>
function Get-Planet ([string]$Name = '*') {
    $planets = @(
        'Mercury',
        'Venus' , 
        'Earth',  
        'Mars',
        'Jupiter',
        'Saturn',
        'Uranus',
        'Neptune'

    ) | ForEach-Object { [PSCustomObject] $_ }

    $planets | Where-Object { $_.Name -like $Name }
}
Describe 'Testing to make sure the are only 8 planets in the solar system' {
    It 'Given no parameters, it lists all 8 planets' {
        $allPlanets = Get-Planet
        $allPlanets.Count | Should -Be 8
    }

}
