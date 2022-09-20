pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh '''
                docker build -t stratcastor/automated-image:latest -t stratcastor/automated-image:$BUILD_NUMBER .
                docker push stratcastor/automated-image:latest
                docker push stratcastor/automated-image:$BUILD_NUMBER
                '''
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                ssh -i '~/.ssh/id_rsa' jenkins@34.142.32.81 << EOF
                docker stop auto-container
                docker rm auto-container
                docker run -d -p 8080:8080 --name auto-container stratcastor/automated-image:latest
                '''
            }
        }
    }
}
