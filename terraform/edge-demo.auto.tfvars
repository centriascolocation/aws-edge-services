aws_region      = "eu-central-1"
aws_allowed_ids = ["117024675156"]

environment = {
  name                   = "aws-edge-services"
  default_region         = "eu-central-1"
  account_alias          = "demo"
  apex_domain            = "centrias.me"
  viewer_certificate_arn = "arn:aws:acm:us-east-1:117024675156:certificate/877b12f4-23c3-48ab-95f9-0a0589a0c986"
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
