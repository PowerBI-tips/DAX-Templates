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