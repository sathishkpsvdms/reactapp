Set-StrictMode -Version 'Latest'
$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'

#Declare variables
$Builddir= "%teamcity.build.checkoutDir%\build"
$deploypath = "C:\inetpub\wwwroot\reactapp\"
$GetFile = get-childitem -file -recurse -name $Builddir
$Devserver = "dev2-app.united.com"

$Filenames = foreach ($FileName in $GetFile)
{

cd $Builddir

#Deploy files
write-output "Copying $FileName to Folder $deploypath"
Copy-Item $FileName $deploypath -force -Recurse
}

