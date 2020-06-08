resource "aws_iam_user" "main" {
  name = var.name
}

resource "aws_iam_access_key" "main" {
  user = aws_iam_user.main.name
}
