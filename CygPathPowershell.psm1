<#
.SYNOPSIS
Implementing `cygpath` in Powershell
.DESCRIPTION
This module/script will allow a user to convert a path string to a format that
is more compatible/suitable for the unix path system.
#>

# First, source the function.
. ./ConvertPathToCygpath.ps1
# Additionally, attempt to create the alias
New-Alias cygpath Convert-PathToCygpath -description "cygpath utility for Powershell"

# Next, export the function to be consumed by Import-Module
$ExportThis = @{
    Function = @("Convert-PathToCygpath")
    Alias = @("cygpath")
}
Export-ModuleMember @ExportThis
