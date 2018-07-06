node {
    stage ('Get Latest Code') {
        git branch: 'master', url: 'https://github.com/cvakumark/DemoApplication.git'
    }
    
    stage ('Restore Dependecies') {
        bat 'dotnet restore'
    }
    
    stage ('Build for Error Checks') {
        bat 'dotnet build'
    }
    
    stage ('Publish Binaries') {
        bat 'dotnet publish --configuration Release --output bin/output'
    }
    stage ('Archive Artifacts') {
        zip dir: 'DemoApplication/bin/output', glob: '', zipFile: "${env.WORKSPACE}/DemoApplication.${env.BUILD_ID}.zip"
	}
	stage ('Upload Artifacts') {
        powershell """$URI = New-Object System.Uri("http://localhost:8081/artifactory/DemoApplication/DemoApplication_${env.BUILD_ID}.zip")  
		$SOURCE = "./DemoApplication_${env.BUILD_ID}.zip"
		$AF_USER = "admin"  
		$AF_PWD = ConvertTo-SecureString "admin123" -AsPlainText -Force  
		$CREDS = New-Object System.Management.Automation.PSCredential ($AF_USER, $AF_PWD)  
		Invoke-WebRequest -Uri $URI -InFile "$SOURCE" -Method Put -Credential "$CREDS" -UseBasicParsing"""
	}
	
 }