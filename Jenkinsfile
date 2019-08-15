pipeline {
    agent any
    stages { 
        stage('Restore') {
        	
        	steps{
        		echo 'Restoring packages'
        		sh 'dotnet restore'
        	}
        }
        stage('Build') {
        	
        	steps{
        		echo 'Building project'
        		sh 'dotnet build WebApplication10.sln -p:Configuration=release -v:n'
        	}
        }
        stage('Test') {
        	
        	steps{
        		echo 'Testing project'
        		sh 'dotnet test WebApplication10.sln '
        	}
        }
        stage('Publish') {
        	
        	steps{
        		echo 'Publishing project'
        		sh 'dotnet publish'
        	}
        }
        stage('Deploy') {
        	
        	steps{
        		echo 'Deploy project'
        		sh 'dotnet WebApplication10/bin/Release/netcoreapp2.2/WebApplication10.dll'
        	}
        }
        

    }
    post{
             success{
                 archiveArtifacts artifacts: '**', fingerprint:true
                 sh 'dotnet WebApplication10/bin/Release/netcoreapp2.2/WebApplication10.dl'
             }
        }
}