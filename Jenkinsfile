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
    
 }