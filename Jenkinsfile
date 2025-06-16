pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/gitneo/qryos-1.git'
        BRANCH = 'master'
        APP_NAME = 'qryosr'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone from GitHub') {
            steps {
                git credentialsId: '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',git branch: "${BRANCH}", url: "${GIT_REPO}"
            }
        }

        stage('Build with Maven') {
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
            echo "✅ Build and Docker image creation successful!"
        }
        failure {
            echo "❌ Build failed."
        }
    }
}
