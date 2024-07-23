data "aws_route53_zone" "selected" {
  count = var.use_dns ? 1 : 0

  name = var.domain

  lifecycle {
    precondition {
      condition     = var.domain != null
      error_message = "The domain name can not be null if enable DNS"
    }
  }
}

resource "aws_route53_record" "this" {
  count = var.use_dns ? 1 : 0

  zone_id = data.aws_route53_zone.selected[0].zone_id
  name    = var.name
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.this.public_ip]
}