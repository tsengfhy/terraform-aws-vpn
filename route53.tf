data "aws_route53_zone" "selected" {
  count = var.use_dns ? 1 : 0

  name = var.hosted_zone_name

  lifecycle {
    precondition {
      condition     = var.hosted_zone_name != null
      error_message = "The Hosted Zone name can not be null if enable DNS"
    }
  }
}

resource "aws_route53_record" "this" {
  count = var.use_dns ? 1 : 0

  zone_id = data.aws_route53_zone.selected[0].zone_id
  name    = "vpn.${data.aws_route53_zone.selected[0].name}"
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.this.public_ip]
}