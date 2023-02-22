resource "aws_iam_user" "default" {
  count = var.enabled ? 1 : 0

  name                 = var.name
  force_destroy        = var.force_destroy
  path                 = var.path
  permissions_boundary = var.permissions_boundary
  tags                 = var.tags
}

resource "aws_iam_user_policy" "default" {
  count  = var.enabled && var.policy_enabled && var.policy_arn != "" ? 1 : 0
  name   = var.name
  #user   = aws_iam_user.default.*.name[0]
  user       = aws_iam_user.default[count.index].name
  policy = var.policy
}

resource "aws_iam_user_policy_attachment" "default" {
  count      = var.enabled && var.policy_enabled && var.policy_arn != "" ? 1 : 0
  #user       = aws_iam_user.default.*.name[0]
  user       = aws_iam_user.default[count.index].name
  policy_arn = var.policy_arn
}

resource "aws_iam_user_group_membership" "default" {
  count      = var.enabled && length(var.groups) > 0 ? 1 : 0
  user       = aws_iam_user.default[count.index].name
  groups     = var.groups
  depends_on = [aws_iam_user.default]
}
