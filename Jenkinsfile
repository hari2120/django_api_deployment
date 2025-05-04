pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Replace with your actual Git repository URL
                git 'https://github.com/hari2120/django_api_deployment.git' 
                echo 'Checking out code from SCM (replace with actual git step)'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t django-api-demo .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh 'docker stop django-api-demo || true'
                    sh 'docker rm django-api-demo || true'
                    // Run the new container in detached mode
                    sh 'docker run -d --name django-api-demo -p 8000:8000 -v $(pwd)/.env:/app/.env django-api-demo'
                }
            }
        }
        stage('Test Deployment') {
            steps {
                script {
                    // Wait a few seconds for the server to start
                    sleep 5 
                    // Test the endpoint
                    sh 'curl http://localhost:8000/api/env-test/'
                }
            }
        }
    }
    post {
        always {
            // Clean up the container after the pipeline runs
            // sh 'docker stop django-api-demo || true'
            // sh 'docker rm django-api-demo || true'
            echo 'Pipeline finished. Consider adding cleanup steps.'
        }
    }
}
