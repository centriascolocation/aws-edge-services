# outputs
output "content_bucket" {
  value       = module.s3_bucket.this_bucket
  description = "properties of bucket"
}
output "log_bucket_name" {
  value       = module.s3_bucket.log_bucket.id
  description = "name of log bucket"
}
