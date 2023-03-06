// pipeline {
//     agent any
//     // environment {
//     //     DOCKER_COMPOSE_VERSION = "1.29.2"
//     // }
//     stages {
//         stage('Verify tooling') {
//             steps {
//                 echo 'docker --version'
//                 echo 'docker-compose --version'
//             }
//         }
//         stage('Verify Docker & Docker Compose') {
//     steps {
//         echo 'sadasddocker --version'
//         sh "docker version"
//         echo 'asdasdsaddocker-compose --version'
//         sh "docker compose version"
//         echo 'docker-compose --versionasdasdasdsa'
//     }
// }
//         // stage('Build image') {
//         //     steps {
//         //         // Build Docker image and push
//         //         sh 'docker --version'
//         //         sh 'docker-compose --version'
//         //     }
//         // }
//         // stage('Deploy to QA') {
//         //     when {
//         //         branch 'qa'
//         //     }
//         //     steps {
//         //         // Deploy to QA environment
//         //         sh 'docker --version'
//         //         sh 'docker-compose --version'
//         //     }
//         // }
//         // stage('Deploy to Production') {
//         //     when {
//         //         branch 'main'
//         //     }
//         //     steps {
//         //         // Deploy to production environment
//         //         sh 'docker --version'
//         //         sh 'docker-compose --version'
//         //     }
//         // }
//     }
// }
pipeline {
    agent {
        docker {
            image 'python:3.9-alpine'
            label 'my-custom-label'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'pip install -r requirements.txt'
                sh 'python app.py'
            }
        }
        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                sh 'docker-compose up -d'
            }
        }
    }
}

