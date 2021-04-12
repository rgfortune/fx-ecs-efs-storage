#------------------------------------------
# Application IAM Role (Instance Profile) 
#------------------------------------------

# Role Trust
resource "aws_iam_role" "bastion" {
  name = "bastion"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

# Policy document
data "aws_iam_policy_document" "bastion_iam_policy" {
  statement {
    sid    = "S3Access"
    effect = "Allow"
    actions = [
      "s3:Get*",
      "s3:List*"
    ]
    resources = ["*"]
  }

  statement {
    sid    = "EFSAccess"
    effect = "Allow"
    actions = [
      "elasticfilesystem:*"
    ]
    resources = ["*"]
  }
}

# Create instance profile
resource "aws_iam_instance_profile" "bastion_instance_profile" {
  name = "bastion"
  role = aws_iam_role.bastion.name
}

# Create IAM policy
resource "aws_iam_policy" "bastion_policy" {
  name        = "bastion_policy"
  path        = "/"
  description = "Bastion instance IAM policy"
  policy      = data.aws_iam_policy_document.bastion_iam_policy.json
}

# Attach the policy to role
resource "aws_iam_policy_attachment" "bastion_attachment" {
  name       = "bastion_proxy_attachment"
  roles      = [aws_iam_role.bastion.name]
  policy_arn = aws_iam_policy.bastion_policy.arn
}