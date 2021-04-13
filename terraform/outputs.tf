# outputs
output "lambda_function_arn" {
  value       = module.lambdaedge_function.lambda_function_arn
  description = "arn of lambda@edge function"
}
