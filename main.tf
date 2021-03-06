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

resource "aws_spot_instance_request" "this" {
  ami                         = data.aws_ami.docker.id
  instance_type               = var.vpn_instance_type
  subnet_id                   = local.subnet_id
  security_groups             = [aws_security_group.this.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.this.key_name
  spot_type                   = "one-time"
  wait_for_fulfillment        = true

  user_data = templatefile("${path.module}/resources/vpn.sh.tpl", {
    port     = var.vpn_port,
    password = var.vpn_pwd,
  })
}