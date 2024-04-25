<!-- BEGIN_TF_DOCS -->
# Terraform AWS VPN module

## Introduction
This module help you provision an instance with VPN on AWS automatically.

## Usage
Install [terraform](https://www.terraform.io/) at first.
And setup [credential file](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html) for AWS CLI.

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
| <a name="input_password"></a> [password](#input\_password) | The VPN password | `string` | n/a | yes |
| <a name="input_ami_parameter_name"></a> [ami\_parameter\_name](#input\_ami\_parameter\_name) | The parameter name for the instance AMI, use the latest kernel AMI as default | `string` | `"/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-6.1-x86_64"` | no |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | The default tags for the VPN | `map(string)` | `{}` | no |
| <a name="input_hosted_zone_name"></a> [hosted\_zone\_name](#input\_hosted\_zone\_name) | The Hosted Zone name | `string` | `null` | no |
| <a name="input_instance_profile_name"></a> [instance\_profile\_name](#input\_instance\_profile\_name) | The instance profile name | `string` | `null` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type | `string` | `"t3.nano"` | no |
| <a name="input_port"></a> [port](#input\_port) | The VPN port | `number` | `8388` | no |
| <a name="input_product"></a> [product](#input\_product) | The VPN name | `string` | `"vpn"` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to provision the VPN, default is Tokyo | `string` | `"ap-northeast-1"` | no |
| <a name="input_use_dns"></a> [use\_dns](#input\_use\_dns) | The flag to indicate if to create a hostname for the VPN | `bool` | `false` | no |
| <a name="input_use_ipv6"></a> [use\_ipv6](#input\_use\_ipv6) | The flag to indicate if to enable ipv6 | `bool` | `false` | no |
| <a name="input_use_ssh"></a> [use\_ssh](#input\_use\_ssh) | The flag to indicate if to enable SSH | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC to provision the VPN, use the default VPC if missing | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hostname"></a> [hostname](#output\_hostname) | The VPN hostname if enable DNS |
| <a name="output_ip"></a> [ip](#output\_ip) | The VPN public ip |
| <a name="output_password"></a> [password](#output\_password) | The VPN password |
| <a name="output_port"></a> [port](#output\_port) | The VPN port |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2 |



## Resources

| Name | Type |
|------|------|
| [aws_default_route_table.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_route_table) | resource |
| [aws_default_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.icmp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.ssh](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.tcp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.udp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_spot_instance_request.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_iam_instance_profile.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_instance_profile) | data source |
| [aws_internet_gateway.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/internet_gateway) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_ssm_parameter.ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameter) | data source |
| [aws_subnets.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |


<!-- END_TF_DOCS -->