module "s3_bucket" {
  source      = "centriascolocation/security/aws//modules/secure-s3-bucket"
  version     = "1.5.0"
  bucket_name = "${var.config["apex_domain"]}-cdn-content"
  enabled     = true
}
