variable "region" {
  type        = string
  description = "The region to use to bootstrap resources."
  default     = "ap-northeast-1"
  nullable    = false
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for all resources."
  default     = {
    Product = "VPN"
  }
}
