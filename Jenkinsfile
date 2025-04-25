pipeline {
    agent any
    
    stages {
        stage("Code checkout") {
            steps {
                git branch: 'main', url: 'https://github.com/manibabu-dnv/Jenkins_docker-project.git'
            }
        }
        stage("Image build") {
            steps {
                sh 'docker image build -t manibabudnv/todo-app:v$BUILD_ID .'
                sh 'docker image tag manibabudnv/todo-app:v$BUILD_ID manibabudnv/todo-app:latest'
            }
        }
        stage("Image Push") {
            steps {
                
            }
        }
    }
}
