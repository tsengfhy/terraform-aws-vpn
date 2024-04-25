output "hostname" {
  description = "The VPN hostname if enable DNS"
  value       = var.use_dns ? aws_route53_record.this[0].name : ""
}

output "ip" {
  description = "The VPN public ip"
  value       = local.ip
}

output "port" {
  description = "The VPN port"
  value       = var.port
}

output "password" {
  description = "The VPN password"
  value       = var.password
}