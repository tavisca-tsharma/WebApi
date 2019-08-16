pipeline {
    agent any
	parameters {		
			string(	name: 'GIT_SSH_PATH',
					defaultValue: "https://github.com/tavisca-ysant/DemoApi.git",
					description: '')

			string(name: 'DOCKER_FILE',
			       defaultValue: 'demoapi')
		    string(name: 'DOCKER_CONTAINER_NAME',
			       defaultValue: 'demoapi-container')
		    
    }
	
    stages {
        stage('Build') {
            steps {
				bat 'dotnet restore'
                bat 'dotnet build -p:Configuration=release -v:n'
				
            }
        }
		
        stage('Test') {
            steps {
                bat 'dotnet test' 
            }
        }
		stage('Publish') {
            steps {
                bat 'dotnet publish -c Release -o publish' 
            }
        }
		stage('Deploy'){
			
		     steps{
			    bat '''
				if(docker inspect -f {{.State.Running}} ${DOCKER_CONTAINER_NAME})
				then
					docker container rm -f ${DOCKER_CONTAINER_NAME}
				fi
			    '''
			    bat 'docker build -t ${DOCKER_FILE} -f Dockerfile .'
				bat 'docker run --name ${DOCKER_CONTAINER_NAME} -d -p 65208:65208/tcp ${DOCKER_FILE}:latest'
				bat 'docker image rm -f ${DOCKER_FILE}:latest'
			 }
		}
		
    }
	post{
	  always{
	      deleteDir()
	  }
	}
}
