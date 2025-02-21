pipeline {
    agent {
        label 'AGENT-1'
    }
    options{
        disableConcurrentBuilds()
        timeout(time: 10, unit: 'MINUTES')
    }
    environment{
        DEBUG = 'true'
        appVersion= ''
    }
    
    stages {
        stage('Read Version') {
            steps {
                script{
                    def packageJson = readJSON file: 'package.json'
                    appVersion= packageJson.version
                    echo "APP Version is : ${appVersion}"
                }
                
            }
        }
        stage('Install Dependencies'){
            steps{
                script{
                sh 'npm install'
                echo 'dependencies installed'
            }
        }
        }
        stage('Docker Build'){
            steps{
                sh """
                docker build -t joindevops/backend:${appVersion} .
                docker images
                """
            }
        }
    }

post{
    always{
        echo "This section runs always"
        deleteDir()
}
    success{
        echo 'This runs upon success'
}
    failure{
        echo 'This runs upon failure'
}
}
}
