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
                    app Version= packageJson.version
                    echo "APP Version is : ${appVersion}"
                }
                
            }
        }
        stage('Deploy') {
            when {
                 expression { 
                    env.GIT_BRANCH == 'origin/main'
                }
            steps {
                echo 'Production has started'
                 }

            }
        }
        stage('Test1'){
            steps{
                echo 'This is test'
                sh 'sleep 8'
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
