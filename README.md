<!-- BEGIN_TF_DOCS -->
# Terraform AWS VPN module

## Introduction
This module help you launch an instance with VPN software on AWS automatically.

## Usage
Install [terraform](https://www.terraform.io/) at first.
And setup [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) for AWS cli.

StartUp
```
terraform apply --auto-approve
```

ShutDown
```
terraform destroy --auto-approve
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | Default tags for all resources. | `map(string)` | <pre>{<br>  "product": "VPN"<br>}</pre> | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The type of instance. | `string` | `"m5n.large"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to use to launch resources. | `string` | `"ap-northeast-1"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet to use to launch a instance. | `string` | `null` | no |
| <a name="input_vpn_port"></a> [vpn\_port](#input\_vpn\_port) | The port of VPN. | `number` | `8388` | no |
| <a name="input_vpn_pwd"></a> [vpn\_pwd](#input\_vpn\_pwd) | The password of VPN. | `string` | `"tsengfhy"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_eip"></a> [vpn\_eip](#output\_vpn\_eip) | The public ip of VPN |
| <a name="output_vpn_port"></a> [vpn\_port](#output\_vpn\_port) | The port of VPN |
| <a name="output_vpn_pwd"></a> [vpn\_pwd](#output\_vpn\_pwd) | The password of VPN |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |



## Resources

| Name | Type |
|------|------|
| [aws_default_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_spot_instance_request.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request) | resource |
| [aws_ami.docker](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |


<!-- END_TF_DOCS -->