resource "aws_acm_certificate_validation" "covid-mgr" {
  certificate_arn         = aws_acm_certificate.covid-mgr.arn
  validation_record_fqdns = [for record in aws_route53_record.covid-mgr_certificate : record.fqdn]
}
