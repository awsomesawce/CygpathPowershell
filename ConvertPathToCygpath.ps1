function Convert-PathToCygpath {
    <#
    .SYNOPSIS
    Converts a pathname
    .DESCRIPTION
    The returned pathname string will have it's directory separator chars replaced with the forward-slash
    .NOTES
    INPROGRESS
    TODO: Add other options, like converting a pathname to fully represent a wsl pathname.
    #>

    param(
	[Parameter()]
	[ValidateNotNullOrEmpty()][string]$PathString
    )

    $Script:Sep = [System.IO.Path]::DirectorySeparatorChar
    $Script:Altsep = [System.IO.Path]::AltDirectorySeparatorChar

    if ($PathString) {
	Write-Information "Replacing $Sep with $Altsep"
	return $PathString.Replace($Sep, $AltSep)
    }
    else {
	Write-Error "ERROR: Need to give PathString"
    }

}
