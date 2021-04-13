terraform {
  required_version = "~> 0.14.5"

  required_providers {
    aws      = "~> 3.16"
    local    = "~> 1.4"
    null     = "~> 2.1"
    template = "~> 2.1"
    random   = "~> 2.2"
    archive  = "~> 2.1"
  }
}
