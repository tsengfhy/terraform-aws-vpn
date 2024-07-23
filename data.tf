locals {
  workspace = terraform.workspace
}

data "aws_region" "current" {}

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ssm_parameter" "ami" {
  name = var.ami_parameter_name
}

data "aws_iam_instance_profile" "selected" {
  count = var.instance_profile_name != null ? 1 : 0

  name = var.instance_profile_name
}