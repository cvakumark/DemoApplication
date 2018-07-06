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
		powershell returnStatus: true, script: """.\\UploadArtifact.ps1 -version ${env.BUILD_ID} -WORKSPACE ${env.WORKSPACE}/DemoApplication.${env.BUILD_ID}.zip"""
	}
		
 }