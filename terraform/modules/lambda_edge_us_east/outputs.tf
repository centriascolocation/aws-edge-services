output "lambda_function_arn" {
  value       = aws_lambda_function.lambda_edge.qualified_arn
  description = "arn of function"
}
output "lambda_function_version" {
  value       = aws_lambda_function.lambda_edge.version
  description = "version of function"
}
output "lambda_function_alias_arn" {
  value       = aws_lambda_alias.lambda_edge_alias.arn
  description = "alias of function"
}
