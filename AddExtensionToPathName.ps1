
<#.SYNOPSIS
Adds an extension to PathName if it doesn't already have one#>
param(
    [ValidateNotNull()][string]$PathName,
    [ValidateNotNull()][string]$Extension
)
if ([System.IO.Path]::HasExtension($PathName)) {
    Write-Error "$PathName already has an extension"
    return $PathName
}

return "${PathName}${Extension}"

