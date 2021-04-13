# outputs
output "bucket_name" {
  value       = module.s3_bucket.this_bucket
  description = "name of bucket"
}
