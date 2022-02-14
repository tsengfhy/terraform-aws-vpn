variable "region" {
  description = "The region to use to bootstrap resources."
  type        = string
  default     = "ap-northeast-1"
  nullable    = false
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default     = {
    Product = "VPN"
  }
}

variable "subnet_id" {
  description = "The subnet to use to bootstrap the instance."
  type        = string
  default     = ""
  nullable    = false
}

variable "instance_type" {
  description = "The instance type for bootstrapping."
  type        = string
  default     = "m5n.large"
  nullable    = false
}

variable "vpn_port" {
  description = "The port of VPN"
  type        = number
  default     = 8388
  nullable    = false
}

variable "vpn_pwd" {
  description = "The password of VPN"
  type        = string
  default     = "tsengfhy"
  nullable    = false
}
