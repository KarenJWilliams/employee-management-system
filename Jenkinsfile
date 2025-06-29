pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Running Maven Build...'
                sh 'mvn clean package'
            }
        }

        stage('Docker Build & Push') {
            steps {
                echo 'Building Docker image...'
                sh '''
                    docker build -t employee-management .
                    docker tag employee-management karenjwilliams/employee-management:latest
                    echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
                    docker push karenjwilliams/employee-management:latest
                '''
            }
        }

        stage('Local Docker Deploy') {
            steps {
                echo 'Deploying container locally...'
                sh '''
                    docker stop employee-management || true
                    docker rm employee-management || true
                    docker run -d -p 8087:8080 --name employee-management karenjwilliams/employee-management:latest
               '''
            }
        }
    }

    environment {
        DOCKER_USERNAME = credentials('dockerhub-username') // Add in Jenkins credentials
        DOCKER_PASSWORD = credentials('dockerhub-password')
    }
}
