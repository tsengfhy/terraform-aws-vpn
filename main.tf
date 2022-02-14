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
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group" "this" {
  description = "VPC security group for VPN"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = var.vpn_port
    to_port     = var.vpn_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "this" {
  key_name   = "vpn"
  public_key = file("${path.module}/cert/default.pub")
}

data "aws_ami" "docker" {
  owners      = ["amazon"]
  name_regex  = "^amzn-ami-\\S+-ecs-optimized"
  most_recent = true
}

resource "aws_spot_instance_request" "this" {
  ami                         = data.aws_ami.docker.id
  instance_type               = var.instance_type
  user_data                   = templatefile("${path.module}/script/vpn.sh", {
    port = var.vpn_port, password = var.vpn_pwd
  })
  subnet_id                   = var.subnet_id != "" ? var.subnet_id : element(tolist(data.aws_subnet_ids.default.ids), 0)
  security_groups             = [aws_security_group.this.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  wait_for_fulfillment        = true
}