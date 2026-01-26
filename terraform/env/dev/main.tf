provider "aws" {
  region                      = "us-east-1"
  access_key                  = "fake"
  secret_key                  = "fake"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
}

module "web_sg" {
  source = "../../modules/security_groups"
  name   = "web-sg"
  # using insecure default cidr
}

module "data_bucket" {
  source          = "../../modules/s3"
  bucket_name     = "dev-data-bucket"
  enable_encryption = false   # explicit insecurity
}

module "app_iam" {
  source = "../../modules/iam"
}
