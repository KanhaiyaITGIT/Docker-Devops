pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps {
                echo "cloning repository..."
                git url: 'https://github.com/KanhaiyaITGIT/Docker-Devops.git', branch: 'main'
                echo "git repo cloned"
            }
        }
        stage('Build docker image') {
            steps {
                echo "building image....!!"
                sh 'docker build -t mywebapp:latest .'
                echo "image built successfully"
            }
        }
        stage('Run container') {
            steps {
                echo "running container...!!"
                sh 'docker run -d --name myweb -p 8082:80 mywebapp:latest'
            }
        }
    }
}
