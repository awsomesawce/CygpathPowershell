# .SYNOPSIS
# Find if msys2 is installed and where it would be located

[cmdletbinding()]
param([switch]$MyDbg)

<#.SYNOPSIS
This class is almost unneccessary.
#>
class ScoopNotInstalledError : System.Exception {
    $msg = "Scoop is not installed"
    ScoopNotInstalledError([string]$m) {
        $this.msg = $m
        Write-Host "Instanciated error" -fore darkcyan
    }
    ScoopNotInstalledError() {
        $this.msg = "Scoop is not installed.  Get it at https://scoop.sh"
        $this._verbose = $false
    }
    static returnErrRecord([string]$errId, [switch]$v) {
        $er = [System.Management.Automation.ErrorRecord]::new(
            [Exception]::new(),
            $errId, 
            [System.Management.Automation.ErrorCategory]::ResourceUnavailable, 
        (get-command scoop)
        )
        if ($v) { Write-Warning "This is a static method from [ScoopNotInstalledError]" }
        "none"
    }
}


if (Get-Command scoop -ea ignore) {
    $Script:MsysLocation = scoop prefix msys2
    if ($MyDbg) {
        scoop list | tee-object -variable scooplist
        return $scooplist | Where-Object { $_.Name -eq "msys2" } | Format-List
        write-output $scooplist[0] | Get-Member
    }
    return $MsysLocation
}
else { 
    # Trying to be fancy here with my own exception.  Not necessary.
    throw [ScoopNotInstalledError]::new() 
}
