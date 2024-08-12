# declares the source of where you want terraform to get your code
provider "aws" {
  region = var.aws_region
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.62.0"
    }
    awsutils = {
      source = "cloudposse/awsutils"
    }
  }
}
