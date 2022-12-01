pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t gcr.io/lbg-python-cohort-8/mnpythonapp-image:latest -t gcr.io/lbg-python-cohort-8/mnpythonapp-image:$BUILD_NUMBER .
                docker push gcr.io/lbg-python-cohort-8/mnpythonapp-image:latest
                docker push gcr.io/lbg-python-cohort-8/mnpythonapp-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                kubectl apply -f ./kubernetes/application.yml
                kubectl apply -f ./kubernetes/nginx.yml
                kubectl rollout restart deployment mnpythonapp
                kubectl rollout restart deployment nginx
                '''
            }
        }
    }
}
