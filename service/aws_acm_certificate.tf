resource "aws_acm_certificate" "covid-mgr" {
  domain_name               = data.aws_route53_zone.covid-mgr.name
  subject_alternative_names = []
  validation_method         = "DNS"
}
