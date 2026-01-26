pipeline {
    agent any
    stages{
        stage('DEBUG - Terraform dir') {
  steps {
    sh '''
      pwd
      ls
      ls terraform
      ls terraform/env
      ls terraform/env/dev
    '''
  }
}

        stage('Terraform Init') {
            steps {
                sh 'cd terraform/env/dev'
                sh 'terraform init -backend=false'
                sh 'ls'
        }
    }
    stage('Terraform Validate') {
        steps {
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
            sh 'terraform validate'
            sh 'ls'
            
      }
    }
    stage('Terraform plan'){
        steps{
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
            sh 'terraform plan -out=tfplan'
            sh 'ls'
          }
      }
      stage('Terraform show'){
        steps{
            sh 'terraform init -backend=false'
            sh 'terraform show -json tfplan > plan.json'
            sh 'ls'
          }
      }
      stage('Tfsec'){
        steps{
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
            sh 'ls'
            sh 'tfsec .'
            sh 'cd terraform/modules/network'
            sh 'terraform init -backend=false'
            sh 'tfsec .'
            sh 'cd terraform/modules/s3'
            sh 'terraform init -backend=false'
            sh 'tfsec .'
            sh 'cd terraform/modules/security_groups'
            sh 'terraform init -backend=false'
            sh 'tfsec .'
          }
      }
    }
}