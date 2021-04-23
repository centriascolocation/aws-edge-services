locals {
  region                 = var.config["default_region"]
  region_config          = var.config[local.region]
  apex_domain            = var.config["apex_domain"]
  viewer_certificate_arn = var.config["viewer_certificate_arn"]
  s3_origin_id           = var.config["s3_origin_id"]
  price_class            = lookup(local.region_config["CDN_settings"], "price_class")

  common_tags = merge(
    lookup(local.region_config, "tags"),
    {
      Module = "aws.terraform.modules.cf_distribution"
    }
  )
}

resource "aws_cloudfront_distribution" "cf_distribution" {
  enabled             = true
  aliases             = [local.apex_domain]
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  price_class         = local.price_class
  tags                = local.common_tags
  web_acl_id          = var.web_acl_arn

  logging_config {
    include_cookies = false
    bucket          = var.log_bucket.bucket_regional_domain_name
    prefix          = "cloudfront"
  }

  origin {
    domain_name = var.content_bucket.bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = local.s3_origin_id
    compress         = true
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    lambda_function_association {
      event_type = "origin-request"
      lambda_arn = var.lambda_function_alias_arn
    }
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    acm_certificate_arn      = local.viewer_certificate_arn
    minimum_protocol_version = "TLSv1.2_2019"
    ssl_support_method       = "sni-only"
  }
}

resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "OAI for Domain ${local.apex_domain}"
}

data "aws_iam_policy_document" "oai_bucket_policy" {
  statement {
    sid    = "OaiBucketAccess"
    effect = "Allow"
    actions = [
      "s3:GetObject",
    ]
    principals {
      identifiers = [aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn]
      type        = "AWS"
    }
    resources = ["${var.content_bucket.arn}/*"]
  }
}

resource "aws_s3_bucket_policy" "content_bucket_oai_policy" {
  bucket = var.content_bucket.id
  policy = data.aws_iam_policy_document.oai_bucket_policy.json
}
