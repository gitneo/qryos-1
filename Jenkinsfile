pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/gitneo/qryos-1.git'
        GIT_BRANCH = 'master'
        APP_NAME = 'qryosr'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/gitneo/qryos-1.git',
                branch: 'master',
                credentialsId: 'github-pat'
            }
        }

        stage('Build Application') {
            steps {
                sh 'mvn clean package -DskipTests=false'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t ${APP_NAME}:${IMAGE_TAG} ."
            }
        }
    }

    post {
        success {
            echo '✅ Pipeline completed successfully.'
        }
        failure {
            echo '❌ Pipeline failed.'
        }
    }
}
