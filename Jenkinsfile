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
    }
    
    stages {
        stage('Read Version') {
            steps {
                script{
                    def packageJson = readJSON file:
                    'package.json'
                    app Version= packageJson.Version
                    echo 'APP Version is : ${appVersion}'
                }
                
            }
        }
        // stage('approval'){
		// 	input {
        //         message "Should we continue?"
        //         ok "Yes, we should."
        //         submitter "alice,bob"
        //         parameters {
        //             string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        //         }
        //     }
        //     steps {
        //         echo "Hello,${PERSON},nice to meet you."
        //     }
        // }
        stage('Deploy') {
            when {
                 branch 'production'
                }
            steps {
                echo 'Production has started'
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