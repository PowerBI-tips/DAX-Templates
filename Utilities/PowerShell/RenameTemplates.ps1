<#
This scipt will generate a Readme.md file per directory under the templates directoy
It expects to be run from the top level of the repository

Author: Kevin Arnold

#>

$StartLocation = Get-Location
$TemplateDir = $StartLocation.Path + '\templates'
$TemplatesDirs = Get-ChildItem -Path $TemplateDir -Recurse | Where-Object {$_.PSIsContainer}

foreach ($d in $TemplatesDirs){

    $CurrentDir = $d.FullName
    $Templates = Get-ChildItem -Path $CurrentDir -Filter *.qdt.json



    foreach ( $t in $Templates) {
        $c = Get-Content $t.FullName | Out-String | ConvertFrom-Json
        $Newname = $c.templateName + '.qdt.json'
        Rename-Item -Path $t.FullName -NewName $Newname
    }
}