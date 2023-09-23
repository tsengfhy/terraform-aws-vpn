resource "aws_security_group" "this" {
  name        = "${local.workspace}-${var.product}-sg"
  description = "Security group for VPN"
  vpc_id      = local.vpc_id
}

resource "aws_security_group_rule" "inbound" {
  security_group_id = aws_security_group.this.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = var.port
  to_port           = var.port
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "outbound" {
  security_group_id = aws_security_group.this.id
  type              = "egress"
  protocol          = "-1"
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "icmp" {
  count = var.use_ssh ? 1 : 0

  security_group_id = aws_security_group.this.id
  type              = "ingress"
  protocol          = "icmp"
  from_port         = -1
  to_port           = -1
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "ssh" {
  count = var.use_ssh ? 1 : 0

  security_group_id = aws_security_group.this.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}