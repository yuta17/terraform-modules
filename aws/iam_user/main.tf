resource "aws_iam_user" "hassanterraform" {
  name = var.name
}

resource "aws_iam_access_key" "hassanterraform" {
  user = aws_iam_user.hassanterraform.name
}
