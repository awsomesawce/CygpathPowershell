# Notes for CygpathPowershell

- [ ] Find relative scripts that end in `.ps1`


```powershell
# Gets all those files and puts them in a variable.
$files = foreach ($i in @("*.ps1", "*.psm1", "*.psd1")) { 
    @{
        "$i files" = (get-childitem ~/ -filter "$i" -recurse)
    }
}
```

_Or_ if you want to use a typed generic collection:


```powershell
$Script:fileInfoList = [List[FileInfo]]::new()
$Script:patterns = [string[]]@("*.ps1", "*.md", "*.psm1",
"*.psd1", "*.js", "*.py", "*.exe")
$Script:patterns | Foreach-object {
    Get-Childitem . -filter $_ | foreach {
        $fileInfoList.Add($_)
    }
}
# then return the list
# but it might not be a list when it is in the parent scope.
$return @{type=$fileInfoList.gettype().FullName
list=$fileinfolist}
```