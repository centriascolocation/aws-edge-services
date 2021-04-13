provider "aws" {
  region              = var.aws_region
  allowed_account_ids = var.aws_allowed_ids
}

provider "aws" {
  alias  = "us"
  region = "us-east-1"
}

## todo: enable if terraform backend is desireable
#terraform {
#  backend "s3" {
#    bucket = "aws.terraform.state.demo"
#
#    dynamodb_table = "terraform-lock-demo"
#    key            = "terraform.tfstate"
#    region         = "eu-central-1"
#    encrypt        = true
#  }
#}

module "cdn_bucket" {
  source = "./modules/s3_bucket"
  config = var.environment
}
