variable "product" {
  description = "The name for the product"
  type        = string
  default     = "vpn"
}

variable "region" {
  description = "The region to provision resources"
  type        = string
  default     = "ap-northeast-1"
}

variable "default_tags" {
  description = "The default tags for all resources"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "The VPC to provision an instance"
  type        = string
  default     = null
}

variable "vpn_instance_type" {
  description = "The instance type of VPN"
  type        = string
  default     = "t3.nano"
}

variable "vpn_port" {
  description = "The port of VPN"
  type        = number
  default     = 8388
}

variable "vpn_pwd" {
  description = "The password of VPN"
  type        = string
}

variable "use_ssh" {
  description = "The flag to indicate if to enable SSH"
  type        = bool
  default     = false
}

variable "use_ssm" {
  description = "The flag to indicate if to enable SSM"
  type        = bool
  default     = false
}

variable "use_dns" {
  description = "The flag to indicate if to create an A record in desired Hosted Zone for the instance"
  type        = bool
  default     = false
}

variable "hosted_zone_name" {
  description = "The name of desired Hosted Zone"
  type        = string
  default     = null
}
