node {
    stage ('Get Latest Code') {
        git branch: 'master', url: 'https://github.com/cvakumark/DemoApplication.git'
    }
    
    stage ('Restore Dependecies') {
        bat 'dotnet restore'
    }
    
    stage ('Build for Error Checks') {
        bat 'dotnet dotnet build'
    }
    
    stage ('Publish Binaries') {
        bat 'dotnet publish -c out'
    }
    
    stage ('UploadtoArtifactory') {
        bat "docker image build -t kjanshair/aspnetcore-example:${env.BUILD_NUMBER} ."    
    }
}