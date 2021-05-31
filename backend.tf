#Set S3 backend for persisting TF state file remotely, ensure bucket already exits
# And that AWS user being used by TF has read/write perms
terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region  = "us-gov-east-1"
    profile = "jerry.cutshaw.govcloud.demo"
    key     = "lab-demo-environment-terraformstate"
    bucket  = "terraform-demo-govcloud"
  }
}

#NOTE you can get the credentials file below simply by installing AWS CLI and doing aws configure
provider "aws" {
  region                  = var.region
  shared_credentials_file = ".aws/credentials"
  profile                 = "jerry.cutshaw.govcloud.demo"
}
