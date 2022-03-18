resource "aws_route53_record" "covid-mgr_certificate" {
  zone_id = data.aws_route53_zone.covid-mgr.zone_id

  for_each = {
    for dvo in aws_acm_certificate.covid-mgr.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  name    = each.value.name
  records = [each.value.record]
  type    = each.value.type
  ttl     = 60
}
