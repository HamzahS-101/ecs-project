resource "aws_route53_record" "cert-validation-record" {
    for_each = {
        for dvo in aws_acm_certificate.cert.domain_validation_options : dvo.domain_name => {
            name = dvo.resource_record_name
            record = dvo.resource_record_value
            type = dvo.resource_record_type
            }
        }

  zone_id = aws_route53_zone.my-hosted-zone.zone_id
  name = each.value.name
  records = [each.value.record]
  type = each.value.type
  ttl = 60
}

resource "aws_route53_record" "alb-record" {
    zone_id = aws_route53_zone.my-hosted-zone.zone_id
    name = "tm"
    records = [aws_lb.tc-lb.dns_name]
    type = "CNAME"
    ttl = 60
}
