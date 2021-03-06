param (
        [string]$version1 = $(throw "-version1 is required")
        [string]$name = $(throw "-version1 is required")
        
    )

# Delete Existing zip files
if(Test-Path -Path "C:\TempDIr\") {
 Remove-Item -Path C:\TempDir\* -Recurse -Force -EA SilentlyContinue -Verbose
}
New-Item -ItemType directory -Path "C:\TempDIr"


function downloadArtifact($version)
{
$AF_USER = "admin"  
$AF_PWD = ConvertTo-SecureString "admin123" -AsPlainText -Force  
$CREDS = New-Object System.Management.Automation.PSCredential ($AF_USER, $AF_PWD) 

$URI = New-Object System.Uri("http://localhost:8081/artifactory/DemoApplication/DemoApplication_$version.zip")  

Invoke-RestMethod -Method GET -Uri $URI -OutFile "C:\TempDir\DemoApplication_$version.zip" -Credential $CREDS -UseBasicParsing
}
downloadArtifact -version "$version1"

function ExtractArtifact($zipfilename, $destination)
{
 $shellApplication = new-object -com shell.application
 $zipPackage = $shellApplication.NameSpace($zipfilename)
 $destinationFolder = $shellApplication.NameSpace($destination)
 
# CopyHere vOptions Flag # 4 - Do not display a progress dialog box.
# 16 - Respond with "Yes to All" for any dialog box that is displayed.
 
$destinationFolder.CopyHere($zipPackage.Items(),20)
}
#Import-Module webAdminstration
# Install IIS if required
Import-Module Servermanager
#Enable DotNet Framework 4
DISM /Online /Enable-Feature /FeatureName:NetFx4 /All
 
$check = Get-WindowsFeature | Where-Object {$_.Name -eq "web-server"}
 
If (!($check.Installed)) {
 Write-Host "Adding web-server"
 Add-WindowsFeature web-server
}
 
#$name = "Admin"
$physicalPath = "C:\inetpub\wwwroot\" + $name
 
# Create Application Pool
try
{
 $poolCreated = Get-WebAppPoolState $name –errorvariable myerrorvariable
 Write-Host $name "Already Exists"
}
catch
{
 # Assume it doesn't exist. Create it.
 New-WebAppPool -Name $name
 Set-ItemProperty IIS:\AppPools\$name managedRuntimeVersion v4.0
}
 
# Create Folder for the website
if(!(Test-Path $physicalPath)) {
 md $physicalPath
}
else {
 Remove-Item "$physicalPath\*" -recurse -Force
}
 
$site = Get-WebSite | where { $_.Name -eq $name }
if($site -eq $null)
{
 Write-Host "Creating site: $name $physicalPath"
 
 # TODO:
 New-WebSite $name -force | Out-Null
 New-WebApplication -Site $name -Name $name -PhysicalPath "C:\inetpub\wwwroot\$name" -ApplicationPool $name
}
 
ExtractArtifact -zipfilename "C:\TempDIr\DemoApplication_$version1.zip" -destination "C:\inetpub\wwwroot\$name"