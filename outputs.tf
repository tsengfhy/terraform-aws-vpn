output "vpn_eip" {
  value = aws_spot_instance_request.vpn.public_ip
}

output "vpn_port" {
  value = var.vpn_port
}

output "vpn_pwd" {
  value = var.vpn_pwd
}