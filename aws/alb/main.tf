resource "aws_lb" "main" {
  name                        = var.name
  load_balancer_type          = var.load_balancer_type
  internal                    = var.internal
  idle_timeout                = var.idle_timeout
  enable_deletion_protection  = var.enable_deletion_protection
  subnets                     = var.public_subnet_ids
  security_groups             = var.security_groups

  access_logs {
    bucket  = var.bucket_id
    enabled = var.access_logs_enabled
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = var.http_port
  protocol          = var.http_protocol

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "これは HTTP です"
      status_code  = "200"
    }
  }
}