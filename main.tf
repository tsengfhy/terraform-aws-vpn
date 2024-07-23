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
  count = var.use_ssh ? 1 : 0

  key_name   = "${local.workspace}-key-${var.name}"
  public_key = file("${path.module}/certs/default.pub")
}

resource "aws_spot_instance_request" "this" {
  ami                         = data.aws_ssm_parameter.ami.value
  instance_type               = var.instance_type
  iam_instance_profile        = var.instance_profile_name != null ? split("/", data.aws_iam_instance_profile.selected[0].arn)[1] : null
  subnet_id                   = local.subnet_id
  vpc_security_group_ids      = [aws_security_group.this.id]
  associate_public_ip_address = true
  key_name                    = var.use_ssh ? aws_key_pair.this[0].key_name : null
  spot_type                   = "one-time"
  wait_for_fulfillment        = true

  user_data = templatefile("${path.module}/resources/bootstrap.sh.tpl", {
    user     = var.use_ssh ? "ec2-user" : "ssm-user",
    port     = var.port,
    password = var.password,
  })
}