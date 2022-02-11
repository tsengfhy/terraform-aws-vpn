/**
 * # Terraform AWS VPN module
 *
 * ## Introduction
 * This module help you launch an instance with VPN software on AWS automatically.
 *
 * ## Usage
 * Install [terraform](https://www.terraform.io/) at first.
 * And setup [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) for AWS cli.
 *
 * StartUp
 * ```
 * terraform apply --auto-approve
 * ```
 *
 * ShutDown
 * ```
 * terraform destroy --auto-approve
 * ```
 */
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
  default_tags {
    tags = var.default_tags
  }
}