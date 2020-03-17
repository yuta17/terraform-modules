resource "aws_iam_group" "group" {
  name = var.name
}

resource "aws_iam_group_policy" "policy" {
  count  = var.use_policy
  name   = "${var.name}-policy"
  group  = aws_iam_group.group.id
  policy = var.policy
}

resource "aws_iam_group_membership" "membership" {
  name  = "${var.name}-membership"
  group = aws_iam_group.group.name
  users = var.membership_users
}
