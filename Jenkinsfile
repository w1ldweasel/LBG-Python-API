pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t gcr.io/lbg-python-cohort-8/pythonapp-image:latest -t gcr.io/lbg-python-cohort-8/pythonapp-image:$BUILD_NUMBER .
                docker push gcr.io/lbg-python-cohort-8/pythonapp-image:latest
                docker push gcr.io/lbg-python-cohort-8/pythonapp-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes/application.yml
                kubectl apply -f ./kubernetes/nginx.yml
                kubectl rollout restart deployment pythonapp
                kubectl rollout restart deployment nginx
                '''
            }
        }
    }
}
