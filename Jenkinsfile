pipeline {
    agent any
    stages{
        stage('Terraform init') {
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
        stage('IAM') {
            steps{
                dir('terraform/modules/iam'){
                    sh '''
                    terraform validate
                    terraform plan -out=tfplan
                    tfsec .
                    '''
                }
            }
        }
        stage('Security groups') {
            steps{
                dir('terraform/modules/security_groups'){
                    sh '''
                    terraform validate
                    terraform plan -out=tfplan
                    tfsec .
                    '''
                }
            }
        }
        stage('S3') {
            steps{
                dir('terraform/modules/s3'){
                    sh '''
                    terraform validate
                    terraform plan -out=tfplan
                    tfsec .
                    '''
                }
            }
        }
    }
}