pipeline {
  agent {
       docker {
          image 'arulkumar1967/build-arul-container-python-4:latest'
          args '-u root:sudo -v $HOME/workspace/rangers-demo:/rangers-demo'
        }
    }
  environment {
        EMAIL_RECIPIENTS = 'arulkr1967@gmail.com'
  }
  stages {

    stage('Build') {
      steps {
            sh 'pip install -r requirements.txt'
            sh './package_lambda.sh rangers_demo_lambda'
        }
	}

    stage('AWS Deployment') {
      steps {
          withCredentials([
            usernamePassword(credentialsId: 'ada90a34-30ef-47fb-8a7f-a97fe69ff93f', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
            usernamePassword(credentialsId: '2facaea2-613b-4f34-9fb7-1dc2daf25c45', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
          ]) {
            sh '''
               cd terraform
               terraform init -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
               terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET} -var repo_dir="/var/lib/jenkins/workspace/rangers-demo/"
            '''
        }
      }
    }
  }
}
