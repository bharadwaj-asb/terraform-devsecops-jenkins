pipeline {
  agent any
  stages {

    stage('Terraform') {
      steps {
        dir('terraform/env/dev') {
          sh '''
            terraform init -no-color
            terraform validate -no-color
            terraform plan -no-color -out=tfplan
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
