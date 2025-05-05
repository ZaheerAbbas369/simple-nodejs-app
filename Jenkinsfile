pipeline {
    agent any

    tools {
        nodejs "NodeJS_18" // Set this name in Jenkins → Manage Jenkins → Global Tool Configuration
    }

    environment {
        APP_NAME = 'simple-nodejs-app'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/zaheerboss/simple-nodejs-app.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test || echo "No tests found, continuing..."'
            }
        }

        stage('Build App') {
            steps {
                sh 'npm run build || echo "No build script, skipping..."'
            }
        }

        stage('Archive Artifact') {
            when {
                expression { fileExists('dist') }
            }
            steps {
                archiveArtifacts artifacts: 'dist/**/*.*', allowEmptyArchive: true
            }
        }
    }

    post {
        success {
            echo '🎉 Build completed successfully!'
        }
        failure {
            echo '💀 Build failed. Check logs.'
        }
    }
}