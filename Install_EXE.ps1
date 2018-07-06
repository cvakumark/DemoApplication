param(
[string] $exe_name
)
# Path for the workdir
$workdir = "C:\TempDir"

#Start the installation
Start-Process -FilePath "$workdir\$exe_name" -ArgumentList "/S"


