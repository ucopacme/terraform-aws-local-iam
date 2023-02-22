# terraform-aws-local-iam


provider "aws" {
  region = "us-west-2"
}

module "iam-user" {
  source = "git::https://git@github.com/ucopacme/terraform-aws-iam-user"

  name           = "kk-iam-user"
  environment    = "test"
  policy_enabled = true
  policy         = data.aws_iam_policy_document.default.json
  policy_arn     = data.aws_iam_policy.ReadOnlyAccess.arn
  tags = {
    "application"    = "test1"
    "createdBy"      = "terraform"
    "environment"    = "dev"
    "group"          = "chs"
    "source"         = "https://github.com"
   
  }
}

data "aws_iam_policy_document" "default" {
  statement {
    actions = [
      "ec2:Describe*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy" "ReadOnlyAccess" {
  arn = "arn:aws:iam::aws:policy/AmazonAthenaFullAccess"
}
