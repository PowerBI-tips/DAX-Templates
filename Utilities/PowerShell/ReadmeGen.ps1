<#
This scipt will generate a Readme.md file per directory under the templates directoy
It expects to be run from the top level of the repository

Author: Kevin Arnold

#>

<# Instructions for using PowerShell ISE
PowerShell ISE 
https://docs.microsoft.com/en-us/powershell/scripting/windows-powershell/ise/introducing-the-windows-powershell-ise?view=powershell-7.2

1. Change the directory to the root level of the Repo. For example the root directory where the DAX-Temmplates could be something like 'c:/repos/DAX-Templates'
2. Open the ReadmeGen.ps1 file in the PowerShell ISE
3. Run the ReadmeGen.ps1 by hitting F5 or clicking the Green Play button in the menu
4. Script should run and update all the readme files in each of the Templates folder directories. 

#> 

# Start Location should be the location of the Root directory of the 
$StartLocation = Get-Location
$TemplateDir = $StartLocation.Path + '\templates'
$TemplatesDirs = Get-ChildItem -Path $TemplateDir -Recurse | Where-Object {$_.PSIsContainer}

Write-Output $StartLocation
Write-Output $TemplateDir
Write-Output $TemplatesDirs

foreach ($d in $TemplatesDirs){

    $CurrentDir = $d.FullName
    $ReadmeFile = $CurrentDir + '\Readme.md'
    $Templates = Get-ChildItem -Path $CurrentDir -Filter *.qdt.json

    "# Templates in the Directory" | Out-File   -FilePath $ReadmeFile 

    foreach ( $t in $Templates) {
        $c = Get-Content $t.FullName | Out-String | ConvertFrom-Json
    
        '## ' + $c.templateName  | Out-File -FilePath $ReadmeFile  -Append
        '### File ' | Out-File -FilePath $ReadmeFile -Append
        $t.Name  | Out-File -FilePath $ReadmeFile -Append
        '### Description' | Out-File -FilePath $ReadmeFile  -Append
        $c.description  | Out-File -FilePath $ReadmeFile  -Append
        '### Support Links' | Out-File -FilePath $ReadmeFile  -Append
        $c.supportURLs  | Out-File -FilePath $ReadmeFile  -Append
        
    }
}