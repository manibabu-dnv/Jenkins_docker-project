pipeline{
    agent any
    
    stages{
        stage("Code checkout"){
            steps{
                git branch: 'main', url: 'https://github.com/manibabu-dnv/Jenkins_docker-project.git'
            }
        }
        stage("image build"){
            steps{
                sh 'docker image build -t manibabudnv/ToDo App:v$BUILD_ID .'
                sh 'docker image tag manibabudnv/ToDo App:v$BUILD_ID manibabudnv/ToDo App:latest'
            }
        }
    }
}
