variable "config" {
  type        = any
  description = "main variable map"
}
variable "web_acl_arn" {
  type        = string
  description = "acl arn for cdn attachment"
}
variable "lambda_function_alias_arn" {
  type        = string
  description = "Arn of Lambda@edge alias for origin request rewrite"
  default     = ""
}
variable "content_bucket" {
  type        = any
  description = "Bucket with HTML content to be served"
}
variable "log_bucket" {
  type        = any
  description = "Bucket with log files"
}
