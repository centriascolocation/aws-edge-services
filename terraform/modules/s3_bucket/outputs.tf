# outputs
output "content_bucket" {
  value       = module.s3_bucket.this_bucket
  description = "properties of bucket"
}
output "log_bucket" {
  value       = module.s3_bucket.log_bucket
  description = "properties of log bucket"
}
