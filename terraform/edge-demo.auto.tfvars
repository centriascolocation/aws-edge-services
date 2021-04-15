aws_region      = "eu-central-1"
aws_allowed_ids = ["PUT-YOUR-ACCOUNT-ID-HERE"]

environment = {
  name                   = "aws-edge-services"
  default_region         = "eu-central-1"
  account_alias          = "demo"
  apex_domain            = "YOUR-APEX-DOMAIN"
  viewer_certificate_arn = "arn:aws:acm:us-east-1:PUT-YOUR-ACCOUNT-ID-HERE:certificate/877b12f4-23c3-48ab-95f9-0a0589a0c986"
  s3_origin_id           = "S3Origin"
  eu-central-1 = {
    CDN_settings = {
      price_class = "PriceClass_100"
    }
    tags = {
      Environment = "aws-edge-services-demo"
      Generator   = "Terraform"
    }
  }
}
