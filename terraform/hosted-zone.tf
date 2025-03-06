resource "aws_route53_zone" "my-hosted-zone" {
    name = var.hosted_zone_domain 
}