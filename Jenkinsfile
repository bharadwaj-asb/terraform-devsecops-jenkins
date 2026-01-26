pipeline {
    agent any
    stages{
        stage('DEBUG – Terraform sees this') {
  steps {
    sh '''
      echo "PWD:"
      pwd
      echo "----- ls -la -----"
      ls -la
      echo "----- find .tf -----"
      find . -maxdepth 3 -name "*.tf"
    '''
  }
}


        stage('Terraform Init') {
            steps {
                sh '''
                'cd terraform/env/dev'
                'terraform init -backend=false'
                sh 'ls'
                '''
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