node {
    stage ('Get Latest1 Code') {
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
        zip dir: 'DemoApplication/bin/output', glob: '', zipFile: "${env.WORKSPACE}/DemoApplication_${env.BUILD_ID}.zip"
	}
	stage ('Upload Artifacts') {
		powershell returnStatus: true, script: """.\\UploadArtifact.ps1 -version ${env.BUILD_ID}"""
	}
	stage ('DeployToDev') {
		powershell returnStatus: true, script: """.\\Web_Deploy.ps1 -version ${env.BUILD_ID}"""
	}
		
 }