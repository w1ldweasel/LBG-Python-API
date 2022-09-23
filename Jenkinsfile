pipeline {
    agent any
    stages {
        stage('test') {
            steps {
                sh '''
                npm init -y
                npm install
                npm test
                '''
            }
        }
        stage('Build') {
            steps {
                sh '''
                docker build -t gcr.io/lbg-090522/automated-image:latest -t gcr.io/lbg-090522/automated-image:$BUILD_NUMBER .
                docker push gcr.io/lbg-090522/automated-image:latest
                docker push gcr.io/lbg-090522/automated-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes/application.yml
                kubectl apply -f ./kubernetes/nginx.yml
                '''
            }
        }
    }
}
