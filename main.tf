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
resource "aws_key_pair" "this" {
  key_name   = "vpn"
  public_key = file("${path.module}/certs/default.pub")
}

data "aws_ami" "docker" {
  owners      = ["amazon"]
  name_regex  = "^amzn-ami-\\S+-ecs-optimized"
  most_recent = true
}

resource "aws_spot_instance_request" "this" {
  ami                         = data.aws_ami.docker.id
  instance_type               = var.instance_type
  user_data                   = templatefile("${path.module}/scripts/vpn.sh", {
    port = var.vpn_port, password = var.vpn_pwd
  })
  subnet_id                   = local.subnet_id
  security_groups             = [aws_security_group.this.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  wait_for_fulfillment        = true
}