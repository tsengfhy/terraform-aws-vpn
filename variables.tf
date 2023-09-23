variable "product" {
  description = "The VPN name"
  type        = string
  default     = "vpn"
}

variable "default_tags" {
  description = "The default tags for the VPN"
  type        = map(string)
  default     = {}
}

variable "region" {
  description = "The region to provision the VPN, default is Tokyo"
  type        = string
  default     = "ap-northeast-1"
}

variable "vpc_id" {
  description = "The VPC to provision the VPN, use the default VPC if missing"
  type        = string
  default     = null
}

variable "ami_parameter_name" {
  description = "The parameter name for the instance AMI, use the latest kernel AMI as default"
  type        = string
  default     = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"
}

variable "instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.nano"
}

variable "instance_profile_name" {
  description = "The instance profile name"
  type        = string
  default     = null
}

variable "port" {
  description = "The VPN port"
  type        = number
  default     = 8388
}

variable "password" {
  description = "The VPN password"
  type        = string
}

variable "use_ssh" {
  description = "The flag to indicate if to enable SSH"
  type        = bool
  default     = false
}

variable "use_dns" {
  description = "The flag to indicate if to create a hostname for the VPN"
  type        = bool
  default     = false
}

variable "hosted_zone_name" {
  description = "The Hosted Zone name"
  type        = string
  default     = null
}
