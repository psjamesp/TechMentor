# things to be loaded or run when starting up
# keep in mind loading times, etc.
Import-Module ActiveDirectory

function prompt{
    "PS " + $(Get-location) + " [$(Get-Date)]> "
    }