module "waf" {
  source  = "umotif-public/waf-webaclv2/aws"
  version = "~> 1.5.0"

  name_prefix            = "demo-waf-setup-cloudfront"
  scope                  = "CLOUDFRONT"
  create_alb_association = false

  visibility_config = {
    metric_name = "demo-waf-setup-waf-main-metrics"
  }

  rules = [
    {
      name     = "AWSManagedRulesCommonRuleSet-rule-1"
      priority = "1"

      override_action = "none" # set to none if not specified

      visibility_config = {
        metric_name = "AWSManagedRulesCommonRuleSet-metric"
      }

      managed_rule_group_statement = {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
        excluded_rule = [
          "SizeRestrictions_QUERYSTRING",
          "SizeRestrictions_BODY",
          "GenericRFI_QUERYARGUMENTS"
        ]
      }
    }
  ]
}
