# outputs
output "lambda_function_arn" {
  value       = module.lambdaedge_function.lambda_function_arn
  description = "arn of lambda@edge function"
}
output "content_bucket_name" {
  value       = module.cdn_bucket.bucket_name
  description = "name of content bucket"
}
