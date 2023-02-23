# terraform-aws-local-iam
Terraform AWS IAM Module


-->

Terraform module to provision AWS [`IAM user`]



## Introduction

The module will create:

*  Local IAM user


## Usage
1. Create main.tf config file, copy/past the following configuration.




```hcl

#
# 




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
    "source"         = "https://github.com/
    
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


##
