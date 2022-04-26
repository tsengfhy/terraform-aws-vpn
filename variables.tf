variable "region" {
  description = "The region to provision resources."
  type        = string
  default     = "ap-northeast-1"
}

variable "default_tags" {
  description = "The default tags for all resources."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "The subnet to provision an instance."
  type        = string
  default     = null
}

variable "vpn_instance_type" {
  description = "The instance type of VPN."
  type        = string
  default     = "t3.nano"
}

variable "vpn_port" {
  description = "The port of VPN."
  type        = number
  default     = 8388
}

variable "vpn_pwd" {
  description = "The password of VPN."
  type        = string
}
