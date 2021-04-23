# outputs
output "waf_acl_id" {
  value       = module.waf.web_acl_id
  description = "acl id for cdn attachment"
}
output "waf_acl_arn" {
  value       = module.waf.web_acl_arn
  description = "acl arn for cdn attachment"
}
