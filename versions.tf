terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.2"
}

provider "aws" {
  region = var.region

  default_tags {
    tags = var.default_tags
  }
}