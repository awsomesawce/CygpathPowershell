# VSCode Profile
<#
.SYNOPSIS
Profile for using Powershell in VSCode
.NOTES
These are purely experimental because the VSCODE profile is different than the user profile.

This is currently `C:\Users\Carl\Documents\PowerShell\Microsoft.VSCode_profile.ps1`
#>
$env:PAGER = 'less'
#$errorview = 'CategoryView'
$Script:CHTSHSCRIPTLOCATION = (Get-Item ~/Documents/Basics/getChtsh.ps1).toString()
$Script:NINFOSCRIPTLOCATION = (Get-Item ~/Documents/Basics/getNpmInfo.ps1).FullName
$Script:NinfoTwoScriptLocation = (Get-Item ~/Documents/BASICS/getNpmInfoAgain.ps1).FullName
$Script:NinfoAltScriptLocation = (Get-Item ~/Documents/Basics/getNpmInfoAlt.ps1).FullName
$Script:AllGetFunctions = (Get-ChildItem ~/Documents/BASICS/get*)

New-Alias chtsh -Value $Script:ChtshScriptLocation -Description "Get a cheatsheet from cht.sh" -Option Constant
New-Alias ninfoOne $Script:NINFOSCRIPTLOCATION
New-Alias ninfoTwo $Script:NinfoTwoScriptLocation
New-Alias ninfoAlt $Script:NinfoAltScriptLocation

function Get-AllGetFunctionsInBasics {
    <#
    .SYNOPSIS
    Returns value of $Script:AllGetFunctions#>
    param()
    return $Script:AllGetFunctions
}

# Import posh-git because it is awesome
Import-Module posh-git
Import-Module powershell-yaml
