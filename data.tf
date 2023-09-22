locals {
  workspace = terraform.workspace
}

data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "selected" {
  owners      = ["amazon"]
  name_regex  = "^amzn2-ami-kernel"
  most_recent = true
}

data "aws_iam_instance_profile" "selected" {
  count = var.vpn_instance_profile_name != null ? 1 : 0

  name = var.vpn_instance_profile_name
}