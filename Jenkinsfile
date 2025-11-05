pipeline {
    agent any
    stages {
        stage('git checkout') {
            steps {
                echo 'git clonning '
                git url: "https://github.com/KanhaiyaITGIT/Docker-Devops.git", branch: "main"
            }
        }
        stage('build docker image') {
            steps {
                echo "building docker image"
                sh "docker build -t dockerimg:latest ."
                echo "docker image built successfully"
            }
        }
        stage('docker container creating') {
            steps {
                echo "docker container running"
                sh "docker run -d --name myapp -p 8083:80"
                echo "docker container ran successfully"
            }
        }
    }
    post {
        success {
            emailext (
                subject: "docker ran successfully"
                body: "docker container is running fine..!!!"
                to: "kanhaiyagupta991018@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "docker ran failed"
                body: "docker container failed..!!!"
                to: "kanhaiyagupta991018@gmail.com"
            )
        }
    }
}
