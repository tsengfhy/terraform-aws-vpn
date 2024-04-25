locals {
  use_default_vpc = var.vpc_id == null

  vpc_id    = try(data.aws_vpc.selected[0].id, aws_default_vpc.default[0].id)
  subnet_id = try(data.aws_subnets.selected[0].ids[0], aws_default_subnet.default[0].id)
}

resource "aws_default_vpc" "default" {
  count = local.use_default_vpc ? 1 : 0

  assign_generated_ipv6_cidr_block = var.use_ipv6
}

resource "aws_default_subnet" "default" {
  count = local.use_default_vpc ? length(data.aws_availability_zones.available.names) : 0

  availability_zone = data.aws_availability_zones.available.names[count.index]
  ipv6_cidr_block   = var.use_ipv6 ? cidrsubnet(aws_default_vpc.default[0].ipv6_cidr_block, 4, count.index) : null
}

resource "aws_default_route_table" "default" {
  count = local.use_default_vpc ? 1 : 0

  default_route_table_id = aws_default_vpc.default[0].default_route_table_id

  route {
    cidr_block = local.anywhere_cidr
    gateway_id = data.aws_internet_gateway.default[0].id
  }

  dynamic "route" {
    for_each = var.use_ipv6 ? [0] : []

    content {
      ipv6_cidr_block = local.anywhere_ipv6_cidr
      gateway_id      = data.aws_internet_gateway.default[0].id
    }
  }
}

data "aws_internet_gateway" "default" {
  count = local.use_default_vpc ? 1 : 0

  filter {
    name   = "attachment.vpc-id"
    values = [aws_default_vpc.default[0].id]
  }
}

data "aws_vpc" "selected" {
  count = !local.use_default_vpc ? 1 : 0

  id = var.vpc_id
}

data "aws_subnets" "selected" {
  count = !local.use_default_vpc ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}