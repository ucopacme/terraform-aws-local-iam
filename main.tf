resource "aws_iam_user" "default" {
  count = var.enabled ? 1 : 0

  name                 = var.name
  force_destroy        = var.force_destroy
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

resource "aws_iam_user_policy" "default" {
  count  = var.enabled && var.policy != "" ? 1 : 0

  name   = var.name
  user   = aws_iam_user.default[0].name
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  for_each = var.enabled && length(var.policy_arns) > 0 ? 
    { for idx, arn in var.policy_arns : arn => arn } : {}

  user       = aws_iam_user.default[0].name
  policy_arn = each.value
}


resource "aws_iam_user_group_membership" "default" {
  count      = var.enabled && length(var.groups) > 0 ? 1 : 0
  user       = aws_iam_user.default[0].name
  groups     = var.groups
  depends_on = [aws_iam_user.default]
}
