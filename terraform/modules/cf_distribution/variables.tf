variable "config" {
  type        = any
  description = "main variable map"
}
variable "lambda_function_alias_arn" {
  type        = string
  description = "Arn of Lambda@edge alias for origin request rewrite"
  default     = ""
}
variable "content_bucket" {
  type        = any
  description = "Name of bucket with HTML content to be served"
}
variable "log_bucket_name" {
  type        = string
  description = "Name of bucket with log files"
}
