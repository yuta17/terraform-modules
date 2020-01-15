resource "aws_s3_bucket" "main" {
  bucket = var.bucket
  acl    = var.acl
  policy = var.policy
  tags   = var.tags
}
