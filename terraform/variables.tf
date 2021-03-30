variable "aws_allowed_ids" {
  type        = list(string)
  description = "Accounts allowed for deployment"
}
variable "aws_region" {
  type        = string
  default     = "eu-central-1"
  description = "where resources where deployed by default"
}
variable "environment" {
  type        = map(any)
  description = "configuration variables"
}
