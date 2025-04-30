pipeline {
    agent any
    
    stages {
        stage("Code checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/manibabu-dnv/Jenkins_docker-project.git'
            }
        }
        stage("image build"){
            steps{
                sh 'docker image build -t manibabudnv/todo-app:v$BUILD_ID .'
                sh 'docker image tag manibabudnv/todo-app:v$BUILD_ID manibabudnv/todo-app:latest'
            }
        }
        stage("Image Push"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'pass', usernameVariable: 'user')]) {
                    sh "docker login -u ${user} -p ${pass}"
                    sh 'docker image push manibabudnv/todo-app:v$BUILD_ID'
                    sh 'docker image push manibabudnv/todo-app:latest'
                    sh 'docker image rmi manibabudnv/todo-app:v$BUILD_ID manibabudnv/todo-app:latest'
                }
            }
        }
        stage("container creating"){
            steps{
                sh 'docker rm -f todo-app || true'
                sh 'docker run -itd --name todo-app -p 3000:3000 manibabudnv/todo-app:latest'
            }
        }
    }
}