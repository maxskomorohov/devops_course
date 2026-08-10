terraform {
  required_version = ">1.10"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
  backend "s3" {
    bucket       = "hw21-7839-6038-8803"
    region       = "eu-central-1"
    key          = "dev/modules/terraform.tfstate"
    profile      = "max_carter"
    use_lockfile = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.aws_region
  profile = "max_carter"
}