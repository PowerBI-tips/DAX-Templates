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
$TemplateReadMe = $TemplateDir + '\README.md'

Write-Output $StartLocation
Write-Output $TemplateDir
Write-Output $TemplatesDirs
Write-Output $TemplateReadMe


"# Overall Templates" | Out-File -FilePath $TemplateReadMe
"Welcome, below is the documentation for all the templates in this repository. You will find a README file in each sub-folder as well." | Out-File -FilePath $TemplateReadMe -Append


foreach ($d in $TemplatesDirs){

    $CurrentDir = $d.FullName
    $ReadmeFile = $CurrentDir + '\Readme.md'
    $Templates = Get-ChildItem -Path $CurrentDir -Filter *.qdt.json

    "# Templates in the Directory" | Out-File   -FilePath $ReadmeFile 

    $n = $d.FullName.Replace($TemplateDir,'')
    "## Templates in: " + $n | Out-File -FilePath $TemplateReadMe -Append

    foreach ( $t in $Templates) {
        $c = Get-Content $t.FullName | Out-String | ConvertFrom-Json
    # Directory Level README
        '## ' + $c.templateName             | Out-File -FilePath $ReadmeFile  -Append
        '### File '                         | Out-File -FilePath $ReadmeFile  -Append 
        $t.Name                             | Out-File -FilePath $ReadmeFile  -Append
        '### Description'                   | Out-File -FilePath $ReadmeFile  -Append
        $c.description                      | Out-File -FilePath $ReadmeFile  -Append
        '### Support Links'                 | Out-File -FilePath $ReadmeFile  -Append
        foreach ($l in  $c.supportURLs ) {
            "- " + $l           | Out-File -FilePath $ReadmeFile  -Append
        }
        
        '### Authors'                       | Out-File -FilePath $ReadmeFile  -Append
        foreach ($a in $c.authors ) {
            "- " + $a           | Out-File -FilePath $ReadmeFile  -Append
        }
        
    
    # Template Directory Level README
        '### ' + $c.templateName  | Out-File -FilePath $TemplateReadMe  -Append
        '#### File '              | Out-File -FilePath $TemplateReadMe  -Append
        $t.Name                   | Out-File -FilePath $TemplateReadMe  -Append
        '#### Description'        | Out-File -FilePath $TemplateReadMe  -Append
        $c.description            | Out-File -FilePath $TemplateReadMe  -Append
        '#### Support Links'      | Out-File -FilePath $TemplateReadMe  -Append
        $links = $c.supportURLs.
        $links | Out-File -FilePath $TemplateReadMe  -Append
        foreach ($l in  $c.supportURLs ) {
            "- " + $l           | Out-File -FilePath $TemplateReadMe  -Append
        }
        '#### Authors'            | Out-File -FilePath $TemplateReadMe  -Append
        foreach ($a in $c.authors ) {
            "- " + $a           | Out-File -FilePath $TemplateReadMe  -Append
        }
    }
}