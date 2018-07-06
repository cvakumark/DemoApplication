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
    stage ('upload to Artifactory') {
        withEnv(['7ZIP_HOME=C:\\\\Program Files (x86)\\\\Caphyon\\\\Advanced Installer 15.0\\\\third-party\\\\7zip']) {
		bat '$7ZIP_HOME/7z.exe a Demoapplication_%BUILD_ID%.zip bin/output/*'  
	}
	

    }
 }