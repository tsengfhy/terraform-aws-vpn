resource "aws_iam_instance_profile" "this" {
  count = var.use_ssm ? 1 : 0

  name = aws_iam_role.instance_profile[0].name
  role = aws_iam_role.instance_profile[0].name
}

resource "aws_iam_role" "instance_profile" {
  count = var.use_ssm ? 1 : 0

  name                = "${local.workspace}-${var.product}-instance-profile-role"
  assume_role_policy  = data.aws_iam_policy_document.assume_role[0].json
  managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]

  inline_policy {
    name = "SSMEncryptAccess"
    policy = jsonencode({
      Statement = [
        {
          Effect = "Allow"
          Action = [
            "kms:Decrypt",
            "kms:GenerateDateKey",
          ]
          Resource = ["arn:aws:kms:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:key/*"]
        },
        {
          Effect = "Allow"
          Action = [
            "logs:PutLogEvent",
          ]
          Resource = ["arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:log-group:*:*"]
        },
        {
          Effect = "Allow"
          Action = [
            "s3:PutObject",
            "s3:GetEncryptionConfiguration",
          ]
          Resource = ["arn:aws:s3:::*"]
        }
      ]
    })
  }
}

data "aws_iam_policy_document" "assume_role" {
  count = var.use_ssm ? 1 : 0

  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}