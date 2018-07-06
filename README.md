"# DemoApplication" 

Task1:
ScriptNames:
1. UploadArtifact.ps1
2. Web_Deploy.ps1
3. Install_EXE.ps1

#UploadArtifact.ps1

The Above script will help to upload packages to artifactory and we should keep package in the current directory and should pass version number like below
./UploadArtifact.ps1 -version <releaseversion>

#Web_Deploy.ps1 -version <releaseversion> -name <virtualdirectory>

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

For EXE silent installation, i have written below script, just to say we can do that too. I have tested with Notepod++.exe
ScriptName: Install_EXE.ps1

Task2:

ScriptNames:
1. Jenkinsfile
2. UploadArtifact.ps1
3. Web_Deploy.ps1

To achive task two, 

#Jenkinsfile

I have created  pipeline job in jenkins and checked in to github and called the Jenkinsfile file from SCM.

1. Which downloads source code from GitHub
2. Download dependents from nuget repository.
3. Compile the source code 
4. Publish binaries to output folder
5. Zip the content 
6. UploadArtifact artifacts to artifactory
7. Host IIS and deploy website

Note: I have setup jenkins and Artifactory in local laptop. 

Tested in Windows Server 2016 Data center from Google Cloud instance.




