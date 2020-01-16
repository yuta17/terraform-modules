resource "aws_route53_zone" "main" {
  name = var.name
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = aws_route53_zone.main.name
  type    = "A"

  alias {
    name                   = var.alb_dns_name
    zone_id                = var.alb_zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "certificate" {
  name    = var.certificate_resource_record_name
  type    = var.certificate_resource_record_type
  records = [var.certificate_resource_record_value]
  zone_id = aws_route53_zone.main.id
  ttl     = 60
}
