locals {
  anywhere_cidr = "0.0.0.0/0"
}

resource "aws_security_group" "this" {
  description = "Security group for VPN"
  vpc_id      = local.vpc_id

  ingress {
    protocol    = "icmp"
    from_port   = -1
    to_port     = -1
    cidr_blocks = [local.anywhere_cidr]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [local.anywhere_cidr]
  }

  ingress {
    protocol    = "tcp"
    from_port   = var.vpn_port
    to_port     = var.vpn_port
    cidr_blocks = [local.anywhere_cidr]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [local.anywhere_cidr]
  }
}