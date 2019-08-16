pipeline {
    agent any
    stages { 
        stage('Restore') {
        	
        	steps{
        		echo 'Restoring packages'
        		bat 'dotnet restore'
        	}
        }
        stage('Build') {
        	
        	steps{
        		echo 'Building project'
        		bat 'dotnet build WebApplication10.sln -p:Configuration=release -v:n'
        	}
        }
        stage('Test') {
        	
        	steps{
        		echo 'Testing project'
        		bat 'dotnet test WebApplication10.sln '
        	}
        }
        stage('Publish') {
        	
        	steps{
        		echo 'Publishing project'
        		bat 'dotnet publish -c Release -o publish'
        	}
        }
        stage('Deploy'){
		     steps{
			    bat 'docker build -t demoapi -f Dockerfile .'
				bat 'docker run --rm -p 65208:65208/tcp demoapi:latest'
			 }
		}
        

    }
}
