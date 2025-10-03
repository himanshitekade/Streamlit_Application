pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/himanshitekade/Streamlit_Application.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t himanshitekade/ht-streamlit-app .'
            }
        }
        stage('Push to DockerHub') {
            steps {
                sh '''
                    docker login -u himanshitekade -p admin@123
                    docker push himanshitekade/ht-streamlit-app
                '''
            }
        }
        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f ht-streamlit-container || true
                    docker run -d --name ht-streamlit-container -p 8501:8501 himanshitekade/ht-streamlit-app
                '''
            }
        }
    }
}
