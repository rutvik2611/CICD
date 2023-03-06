pipeline {
    agent any
    stages {
        stage('Verify Tooling') {
            steps {
                sh 'docker --version'
                sh 'docker-compose --version'
            }
        }
    }
}