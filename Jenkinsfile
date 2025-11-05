pipeline {
    agent any
    environment {
        IMAGE_NAME = "kanhadocker5/dockerimg"
        CONTAINER_NAME = "myapp"
        PORT = "8084"
    }
    stages{
        stage('git checkout') {
            steps {
                echo "git cloning..."
                git url: "https://github.com/KanhaiyaITGIT/Docker-Devops.git", branch: "main"
                echo "git cloned successfully"
            }
        }
        stage('build image') {
            steps {
                echo "building image"
                sh "docker build -t ${IMAGE_NAME}:latest . "
                echo "image built succesfully"
            }
        }
        stage('running container') {
            steps {
                echo "running container"
                sh "docker rm -f ${CONTAINER_NAME} || true"
                sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:80 ${IMAGE_NAME}:latest"
                echo "container is running"
            }
        }
        stage('checking container health') {
            steps {
                echo 'checking container health'
                sh "sleep 5"
                sh "curl -f http://localhost:${PORT} || exit 1"
            }
        }
        stage('docker image push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh '''
                    echo $PASS | docker login -u $USER --password-stdin
                    docker tag ${IMAGE_NAME}:latest $USER/dockerimg:latest
                    docker push $USER/dockerimg:latest
                    '''
                }
            }
        }
    }
    post {
        success {
            emailext (
                subject: "docker ran successfully",
                body: "docker container is running fine..!!!",
                to: "kanhaiyagupta991018@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "docker ran failed",
                body: "⚠️ Docker pipeline failed.\n\nCheck logs: ${env.BUILD_URL}",
                to: "kanhaiyagupta991018@gmail.com"
            )
        }
    }
}
