output "vpn_eip" {
  description = "The public ip of the VPN"
  value = aws_spot_instance_request.this.public_ip
}

output "vpn_port" {
  description = "The port of VPN"
  value = var.vpn_port
}

output "vpn_pwd" {
  description = "The password of VPN"
  value = var.vpn_pwd
}