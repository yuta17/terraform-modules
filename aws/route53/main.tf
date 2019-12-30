resource "aws_route53_zone" "main" {
  name = var.name
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.zone_id
  name    = aws_route53_zone.main.name
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}
