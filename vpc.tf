locals {
  vpc_id    = try(data.aws_vpc.selected[0].id, aws_default_vpc.default[0].id)
  subnet_id = try(data.aws_subnets.selected[0].ids[0], aws_default_subnet.default[0].id)
}

resource "aws_default_vpc" "default" {
  count = var.vpc_id == null ? 1 : 0
}

resource "aws_default_subnet" "default" {
  count = var.vpc_id == null ? length(data.aws_availability_zones.available.names) : 0

  availability_zone = data.aws_availability_zones.available.names[count.index]
}

data "aws_vpc" "selected" {
  count = var.vpc_id != null ? 1 : 0

  id = var.vpc_id
}

data "aws_subnets" "selected" {
  count = var.vpc_id != null ? 1 : 0

  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}