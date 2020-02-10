resource "aws_ssm_parameter" "db_username" {
  name  = "/db/username"
  value = "root"
  type  = "String"
}

resource "aws_ssm_paramter" "db_password" {
  name  = "/db/password"
  value = "uninitialized"
  type  = "SecureString"

  lifecycle {
    ignore_changes = [value]
  }
}
