pipeline {
  agent any
  stages {

    stage('Terraform') {
      steps {
        dir('terraform/env/dev') {
          sh '''
            terraform init -backend=false
            terraform validate
            terraform plan -out=tfplan
          '''
        }
      }
    }

    stage('tfsec') {
      steps {
        dir('terraform/env/dev') {
          sh 'tfsec . --minimum-severity HIGH --no-color'
        }
      }
    }

  }
}
