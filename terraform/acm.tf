resource "aws_acm_certificate" "cert" {
    domain_name = var.domain_name
    validation_method = "DNS"
}
resource "aws_route53_record" "cert-validation-record" {
    for_each = {
        for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
            name   = dvo.resource_record_name
            record = dvo.resource_record_value
            type   = dvo.resource_record_type
            }
        }

  zone_id = aws_route53_zone.my-hosted-zone.zone_id
  name    = each.value.name
  records = [each.value.record]
  type    = each.value.type
  ttl     = 60
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