resource "aws_acm_certificate" "main" {
  domain_name               = var.route53_record_name
  subject_alternative_names = []
  validation_method         = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "main" {
  certificate_arn         = aws_acm_certificate.main.arn
  validation_record_fqdns = [var.route53_record_certificate_fqdn]
}
