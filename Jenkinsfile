pipeline {
    agent any
    // environment {
    //     DOCKER_COMPOSE_VERSION = "1.29.2"
    // }
    stages {
        stage('Verify tooling') {
            steps {
                echo 'docker --version'
                echo 'docker-compose --version'
            }
        }
        stage('Verify Docker & Docker Compose') {
    steps {
        sh "docker --version"
        echo 'docker --version'
        sh "docker-compose --version"
        echo 'docker-compose --version'
    }
}
        // stage('Build image') {
        //     steps {
        //         // Build Docker image and push
        //         sh 'docker --version'
        //         sh 'docker-compose --version'
        //     }
        // }
        // stage('Deploy to QA') {
        //     when {
        //         branch 'qa'
        //     }
        //     steps {
        //         // Deploy to QA environment
        //         sh 'docker --version'
        //         sh 'docker-compose --version'
        //     }
        // }
        // stage('Deploy to Production') {
        //     when {
        //         branch 'main'
        //     }
        //     steps {
        //         // Deploy to production environment
        //         sh 'docker --version'
        //         sh 'docker-compose --version'
        //     }
        // }
    }
}
