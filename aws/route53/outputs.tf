output "domain_name" {
  value = aws_route53_record.main.name
}

output "record_certificate_fqdn" {
  value = aws_route53_record.certificate.fqdn
}
