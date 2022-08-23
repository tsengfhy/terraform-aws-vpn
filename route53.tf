data "aws_route53_zone" "selected" {
  count = var.use_dns ? 1 : 0
  name  = var.hosted_zone_name
}

resource "aws_route53_record" "this" {
  count   = var.use_dns ? 1 : 0
  zone_id = data.aws_route53_zone.selected[0].zone_id
  name    = "proxy.${data.aws_route53_zone.selected[0].name}"
  type    = "A"
  ttl     = 300
  records = [aws_spot_instance_request.this.public_ip]
}