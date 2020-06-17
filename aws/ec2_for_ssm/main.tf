resource "aws_iam_instance_profile" "ec2_for_ssm" {
  name = "ec2-for-ssm"
  role = var.ec2_for_ssm_role_name
}

resource "aws_instance" "for_operation" {
  ami = "ami-0c3fd0f5d33134a76"
  instance_type = "t3.micro"
  iam_instance_profile = aws_iam_instance_profile.ec2_for_ssm.name
  subnet_id = aws_subnet.private.*.id[0]
  user_data = file("./user_data.sh")
}

resource "aws_s3_bucket" "operation" {
  bucket = "operation-pragmatic-terraform"

  lifecycle_rule {
    enabled = true

    expiration {
      days = "180"
    }
  }
}

resource "aws_cloudwatch_log_group" "operation" {
  name = "/operation"
  retention_in_days = 180
}

resource "aws_ssm_document" "session_manager_run_shell" {
  name = "SSM-SessionManagerRunShell"
  document_type = "Session"
  document_format = "JSON"

  content = <<EOF
    {
      "schemaVersion": "1.0",
      "description": "Document to hold regional settings for Session Manager",
      "sessionType": "Standard_Stream",
      "inputs": {
        "s3BucketName": "${aws_s3_bucket.operation.id}",
        "cloudwatchLogGroupName": "${aws_cloudwatch_log_group.operation.name}"
      }
    }
  EOF
}
