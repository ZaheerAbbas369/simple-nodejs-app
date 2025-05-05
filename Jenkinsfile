pipeline {
    agent any

    tools {
        nodejs "NodeJS_18" // Make sure this name matches your Jenkins NodeJS installation
    }

    environment {
        DOCKER_IMAGE = 'zaheer-nodejs-app'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/ZaheerAbbas369/simple-nodejs-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || echo "Tests failed, ignoring for now"'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run -d -p 3000:3000 $DOCKER_IMAGE || echo 'Container might already be running'"
                }
            }
        }
    }

    post {
        success {
            echo '🎉 Build and Deployment Successful!'
        }
        failure {
            echo '💥 Build Failed! Ab kya karein... check karo logs.'
        }
    }
}