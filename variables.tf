variable "region" {
  description = "The region to use to launch resources."
  type        = string
  default     = "ap-northeast-1"
}

variable "default_tags" {
  description = "Default tags for all resources."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "The subnet to use to launch a instance."
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
