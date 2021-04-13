# outputs
output "lambda_function_arn" {
  value       = module.lambdaedge_function.lambda_function_arn
  description = "arn of lambda@edge function"
}
output "content_bucket_name" {
  value       = module.cdn_bucket.content_bucket.id
  description = "name of content bucket"
}
output "log_bucket_name" {
  value       = module.cdn_bucket.log_bucket_name
  description = "name of log bucket"
}
