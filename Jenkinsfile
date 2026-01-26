pipeline {
    agent any
    stages{
        stage('Terraform') {
  steps {
    dir('terraform/env/dev') {
      sh '''
        echo "PWD:"
        pwd
        echo "FILES:"
        ls -la
        terraform init -backend=false
        terraform validate
        terraform plan -out=tfplan
      '''
    }
  }
}


    }
}