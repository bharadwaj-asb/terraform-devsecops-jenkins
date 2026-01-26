pipeline {
    agent any
    stages{
        stage('Terraform') {
  steps {
    dir('terraform/envs/dev') {
      sh '''
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