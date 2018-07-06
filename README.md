"# DemoApplication" 

Task1:
ScriptNames:
1. UploadArtifact.ps1
2. Web_Deploy.ps1
3. Install_EXE.ps1

#UploadArtifact.ps1

The Above script will help us to upload the packages to artifactory. 

./UploadArtifact.ps1 -version #releaseversion

./Web_Deploy.ps1 -version #releaseversion -name #virtualdirectory

The above script will help us to achive below tasks.

1. Download Artifact from Artifactory based on version to TempDir
2. Install IIS adminstration modules
3. Install IIS
4. Enable DotNet framework
5. Check whether WEB-SERVER features has enabled if not Add it
6. Chech for Application Pool exists already else create it
7. Check for physical Folder for the website if exists remove contents from the folder else create new
8. Check for Website if not exits create new else use the same
9. Then extract content to physical folder 

Note: You have suggested me to use EXE and install silently and on top of that I should have done all above operations but I didnt get right installer so used zip file. 

However I have written another below script to install silently. Just to say that we can achive that too. 
I have tested with Notepod++.exe installer

ScriptName: Install_EXE.ps1

Task2:

ScriptNames:
1. Jenkinsfile
2. UploadArtifact.ps1
3. Web_Deploy.ps1

To achive task two, 

#Jenkinsfile

I have developer Jenkinsfile pipeline script and checked in to GITHUB and same has been called from  Pipeline Jenkins Job

1. Which downloads source code from GitHub
2. Download dependents from nuget repository.
3. Compile the source code 
4. Publish binaries to output folder
5. Zip the content 
6. UploadArtifact artifacts to artifactory
7. Host IIS and deploy website


Note: I have setup jenkins and Artifactory in local laptop. 

Tested in Windows Server 2016 Data center from Google Cloud instance.




