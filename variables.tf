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

variable "subnet_id" {
  type        = string
  description = "The subnet to use to bootstrap the instance."
  default     = ""
  nullable    = false
}

variable "instance_type" {
  type        = string
  description = "The instance type for bootstrapping."
  default     = "m5n.large"
  nullable    = false
}

variable "vpn_port" {
  type        = number
  description = "VPN port"
  default     = 8388
  nullable    = false
}

variable "vpn_pwd" {
  type        = string
  description = "VPN password"
  default     = "tsengfhy"
  nullable    = false
}
