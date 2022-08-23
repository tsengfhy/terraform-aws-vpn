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
| <a name="input_vpn_pwd"></a> [vpn\_pwd](#input\_vpn\_pwd) | The password of VPN. | `string` | n/a | yes |
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | The default tags for all resources. | `map(string)` | `{}` | no |
| <a name="input_hosted_zone_name"></a> [hosted\_zone\_name](#input\_hosted\_zone\_name) | The name of desired Hosted Zone. | `string` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | The naming prefix for all resources. | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | The region to provision resources. | `string` | `"ap-northeast-1"` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet to provision an instance. | `string` | `null` | no |
| <a name="input_use_dns"></a> [use\_dns](#input\_use\_dns) | The flag to indicate if to create an A record in desired Hosted Zone for the instance. | `bool` | `false` | no |
| <a name="input_use_ssh"></a> [use\_ssh](#input\_use\_ssh) | The flag to indicate if to enable SSH. | `bool` | `false` | no |
| <a name="input_use_ssm"></a> [use\_ssm](#input\_use\_ssm) | The flag to indicate if to enable SSM. | `bool` | `false` | no |
| <a name="input_vpn_instance_type"></a> [vpn\_instance\_type](#input\_vpn\_instance\_type) | The instance type of VPN. | `string` | `"t3.nano"` | no |
| <a name="input_vpn_port"></a> [vpn\_port](#input\_vpn\_port) | The port of VPN. | `number` | `8388` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_domain"></a> [vpn\_domain](#output\_vpn\_domain) | The domain name of VPN if use DNS. |
| <a name="output_vpn_ip"></a> [vpn\_ip](#output\_vpn\_ip) | The public ip of VPN |
| <a name="output_vpn_port"></a> [vpn\_port](#output\_vpn\_port) | The port of VPN |
| <a name="output_vpn_pwd"></a> [vpn\_pwd](#output\_vpn\_pwd) | The password of VPN |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |



## Resources

| Name | Type |
|------|------|
| [aws_default_subnet.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_subnet) | resource |
| [aws_default_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_vpc) | resource |
| [aws_iam_instance_profile.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_key_pair.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_spot_instance_request.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/spot_instance_request) | resource |
| [aws_ami.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.ec2_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_subnet.selected](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |


<!-- END_TF_DOCS -->