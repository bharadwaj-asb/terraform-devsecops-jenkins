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
        }
    }
    stage('Terraform Validate') {
        steps {
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
            sh 'terraform validate'
            
      }
    }
    stage('Terraform plan'){
        steps{
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
            sh 'terraform plan -out=tfplan'
          }
      }
      stage('Terraform show'){
        steps{
            sh 'terraform init -backend=false'
            sh 'terraform show -json tfplan > plan.json'
          }
      }
      stage('Tfsec'){
        steps{
            sh 'cd terraform/modules/iam'
            sh 'terraform init -backend=false'
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