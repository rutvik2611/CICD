pipeline {
    agent {
        docker { 
            // ubuntu image wsadsaith docker preinstalled
            image 'docker.io/library/ubuntu:latest' 
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }

    stages {
       stage('build') {
          steps {
             sh "docker --version"
             sh "docker-compose --version"
             // other build related steps..
          }
       }
    }
}
