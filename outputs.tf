output "vpn_domain" {
  description = "The domain name of VPN if use DNS"
  value       = var.use_dns ? aws_route53_record.this[0].name : ""
}

output "vpn_ip" {
  description = "The public ip of VPN"
  value       = aws_spot_instance_request.this.public_ip
}

output "vpn_port" {
  description = "The port of VPN"
  value       = var.vpn_port
}

output "vpn_pwd" {
  description = "The password of VPN"
  value       = var.vpn_pwd
}