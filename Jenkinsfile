pipeline {
    agent any
    environment {
        DOCKER_COMPOSE_VERSION = "1.29.2"
    }
    stages {
        stage('Verify tooling') {
            steps {
                sh 'docker --version'
                sh 'docker-compose --version'
            }
        }
        stage('Build image') {
            steps {
                // Build Docker image and push
            }
        }
        stage('Deploy to QA') {
            when {
                branch 'qa'
            }
            steps {
                // Deploy to QA environment
            }
        }
        stage('Deploy to Production') {
            when {
                branch 'main'
            }
            steps {
                // Deploy to production environment
            }
        }
    }
}
