module "s3_bucket" {
  source                            = "centriascolocation/security/aws//modules/secure-s3-bucket"
  version                           = "1.5.0"
  bucket_name                       = "${var.config["apex_domain"]}-cdn-content"
  tags                              = local.common_tags
  lifecycle_glacier_transition_days = 768
  log_bucket_name                   = "${var.config["apex_domain"]}-cdn-accesslogs"
  logging = {
    target_bucket = "${var.config["apex_domain"]}-cdn-accesslogs"
    target_prefix = "bucket_accesslogs/"
  }
}
