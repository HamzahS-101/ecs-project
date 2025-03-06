resource "aws_acm_certificate" "cert" {
    domain_name = var.domain_name
    validation_method = "DNS"
}

resource "time_sleep" "wait_for_dns" {
  depends_on = [aws_route53_record.cert-validation-record]

  create_duration = "3m" 
}
resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for record in aws_route53_record.cert-validation-record : record.fqdn]
  depends_on = [
    time_sleep.wait_for_dns,
    aws_route53_record.cert-validation-record
  ]
}