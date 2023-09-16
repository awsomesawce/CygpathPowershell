<#
.SYNOPSIS
Using a typed generic list for fs stuff
#>

using namespace System.Collections.Generic
using namespace System.IO
using namespace System.Text

[cmdletbinding()]
param()


function Script:Get-MemoryFileHash {
    <#
    .SYNOPSIS
    Get file hash from a stream of bytes
    .DESCRIPTION
    This was taken from the help page for `about_using`.
    When put in line by line it works, but for some reason the darn
    function doesn't work.
    
    .NOTES
    This is all copied from the `about_using` page.  It
    works when called from the script, but not in an outer scope.
    TODO: Find out why it doesnt work in outer scope.
    #>
    param()
    
    [string]$string = "Hello World"
    ## Valid values are "SHA1", "SHA256", "SHA384", "SHA512", "MD5" 
    [string]$algorithm = "SHA256"

    [byte[]]$stringbytes = [UnicodeEncoding]::Unicode.GetBytes($string)

    [Stream]$memorystream = [MemoryStream]::new($stringbytes)       
    $hashfromstream = Get-FileHash -InputStream $memorystream -Algorithm $algorithm
    $hashfromstream.Hash.ToString()
}
$Script:fileInfoList = [List[FileInfo]]::new()
$Script:patterns = [string[]]@("*.ps1", "*.md", "*.psm1",
"*.psd1", "*.js", "*.py", "*.exe")
$Script:patterns | Foreach-object {
    Get-Childitem . -filter $_ | foreach {
        $fileInfoList.Add($_)
    }
}

return @{type=$fileinfolist.gettype().FullName
    list=$fileinfolist
anotherres=get-memoryFilehash
}