pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Node.js and npm') {
            steps {
                script {
                    // Install Node.js and npm (for Ubuntu/Debian-based systems)
                    sh 'curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -'
                    sh 'sudo apt-get install -y nodejs'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install dependencies (e.g., node_modules)
                    sh 'npm install'
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Run tests
                    sh 'npm test'
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploy stage (if applicable)'
                // Add your deployment steps here
            }
        }
    }

    post {
        success {
            echo 'Build and tests successful!'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}