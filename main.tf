/**
 * # Terraform AWS VPN module
 *
 * ## Introduction
 * This module help you provision an instance with VPN on AWS automatically.
 *
 * ## Usage
 * Install [terraform](https://www.terraform.io/) at first.
 * And setup [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) for AWS CLI.
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
  count      = var.use_ssh ? 1 : 0
  key_name   = "${local.prefix}key-vpn"
  public_key = file("${path.module}/certs/default.pub")
}

resource "aws_spot_instance_request" "this" {
  ami                         = data.aws_ami.selected.id
  instance_type               = var.vpn_instance_type
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true
  spot_type                   = "one-time"
  wait_for_fulfillment        = true

  key_name             = var.use_ssh ? aws_key_pair.this[0].key_name : null
  iam_instance_profile = var.use_ssm ? aws_iam_instance_profile.this[0].name : null

  user_data = templatefile("${path.module}/resources/vpn.sh.tpl", {
    port     = var.vpn_port,
    password = var.vpn_pwd,
  })
}