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
  name    = "${var.product}.${data.aws_route53_zone.selected[0].name}"
  type    = var.use_ipv6 ? "AAAA" : "A"
  ttl     = 300
  records = [local.ip]
}