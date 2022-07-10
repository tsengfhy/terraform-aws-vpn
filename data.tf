locals {
  anywhere_cidr_block = "0.0.0.0/0"
  vpc_id              = try(data.aws_subnet.selected[0].vpc_id, aws_default_vpc.default.id)
  subnet_id           = try(data.aws_subnet.selected[0].id, aws_default_subnet.default[0].id)
}

data "aws_subnet" "selected" {
  count = var.subnet_id != null ? 1 : 0
  id    = var.subnet_id
}

data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_default_vpc" "default" {

}

resource "aws_default_subnet" "default" {
  count             = length(data.aws_availability_zones.available.names)
  availability_zone = data.aws_availability_zones.available.names[count.index]
}

data "aws_ami" "selected" {
  owners      = ["amazon"]
  name_regex  = "^amzn2-ami-kernel"
  most_recent = true
}