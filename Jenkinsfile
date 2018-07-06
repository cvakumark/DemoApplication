node {
    stage ('Get Latest Code') {
        git branch: 'master', url: 'https://github.com/cvakumark/DemoApplication.git'
    }
    
    stage ('Restore Dependecies') {
        cmd 'dotnet restore'
    }
    
    stage ('Build for Error Checks') {
        cmd 'dotnet dotnet build'
    }
    
    stage ('Publish Binaries') {
        cmd 'dotnet publish -c out'
    }
    
    stage ('UploadtoArtifactory') {
        cmd "docker image build -t kjanshair/aspnetcore-example:${env.BUILD_NUMBER} ."    
    }
}