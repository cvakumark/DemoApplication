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
        zip dir: 'DemoApplication/bin/output', glob: '', zipFile: "${env.WORKSPACE}/DemoApplication_env.${env.BUILD_ID}.zip"
	

    }
 }