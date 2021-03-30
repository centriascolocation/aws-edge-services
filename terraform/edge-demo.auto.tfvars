aws_region      = "eu-central-1"
aws_allowed_ids = ["PUT-YOUR-ACCOUNT-ID-HERE"]

environment = {
  name                   = "aws-edge-services"
  default_region         = "eu-central-1"
  account_alias          = "demo"
  apex_domain            = "YOUR-DOMAIN"
  viewer_certificate_arn = "arn:aws:acm:us-east-1:PUT-YOUR-ACCOUNT-ID-HERE:certificate/877b12f4-23c3-48ab-95f9-0a0589a0c986"
  s3_origin_id           = "S3Origin"
  eu-central-1 = {
    aws_region = {
      region_name = "eu-central-1"
    }

    tags = {
      Environment = "aws-edge-services-demo"
      Generator   = "Terraform"
    }
  }
}
