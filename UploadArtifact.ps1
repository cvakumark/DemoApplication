param(
[string] $version=30
)

# uploade package from artifactory
function UploadArtifacts($version) {
#cd $env:workspace
$URI = New-Object System.Uri("http://localhost:8081/artifactory/Assignment/DemoApplication_$version.zip")  
#$SOURCE = "./DemoApplication/bin/Debug/netcoreapp2.0/publish/DemoApplication_$version.zip"
$AF_USER = "admin"  
$AF_PWD = ConvertTo-SecureString "admin123" -AsPlainText -Force  
$CREDS = New-Object System.Management.Automation.PSCredential ($AF_USER, $AF_PWD)  

Invoke-WebRequest -Uri $URI -InFile $SOURCE -Method Put -Credential $CREDS -UseBasicParsing

}

UploadArtifacts  -version "$version"