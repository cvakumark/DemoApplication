param(
[string] $version=52
)

# uploade package from artifactory
function UploadArtifacts($version, $workspace) {
#cd $env:workspace
$URI = New-Object System.Uri("http://localhost:8081/artifactory/DemoApplication/DemoApplication_$version.zip")  
$SOURCE = "./DemoApplication_$version.zip"
DemoApplication_$version.zip"
$AF_USER = "admin"  
$AF_PWD = ConvertTo-SecureString "admin123" -AsPlainText -Force  
$CREDS = New-Object System.Management.Automation.PSCredential ($AF_USER, $AF_PWD)  

Invoke-WebRequest -Uri $URI -InFile $SOURCE -Method Put -Credential $CREDS -UseBasicParsing

}

UploadArtifacts  -version "$version" 