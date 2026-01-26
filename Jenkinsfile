pipeline {
    agent any
    stages{
        stage('Terraform Init') {
            steps {
                sh 'cd terraform-devsecops-jenkins/terraform/env/dev'
                sh 'terraform init -backend=false'
        }
    }
    stage('Terraform Validate') {
        steps {
            sh 'cd terraform-devsecops-jenkins/terraform/modules/iam'
            sh 'terraform validate'
      }
    }
    stage('Terraform plan'){
        steps{
            sh 'cd terraform-devsecops-jenkins/terraform/modules/iam'
            sh 'terraform plan -out=tfplan'
          }
      }
      stage('Terraform show'){
        steps{
            sh 'terraform show -json tfplan > plan.json'
          }
      }
      stage('Tfsec'){
        steps{
            sh 'cd terraform-devsecops-jenkins/terraform/modules/iam'
            sh 'tfsec .'
            sh 'cd terraform-devsecops-jenkins/terraform/modules/network'
            sh 'tfsec .'
            sh 'cd terraform-devsecops-jenkins/terraform/modules/s3'
            sh 'tfsec .'
            sh 'cd terraform-devsecops-jenkins/terraform/modules/security_groups'
            sh 'tfsec .'
          }
      }
    }
}