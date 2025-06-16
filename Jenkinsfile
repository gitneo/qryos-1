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
                withCredentials([string(credentialsId: 'github-pat', variable: 'GITHUB_TOKEN')]) {
                    sh 'git clone https://${GITHUB_TOKEN}@github.com/your-username/your-repo.git .'
                    sh "git checkout ${GIT_BRANCH}"
                }
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
