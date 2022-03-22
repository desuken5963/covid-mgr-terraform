resource "aws_acm_certificate" "covid-mgr" {
  domain_name               = data.aws_route53_zone.covid-mgr.name
  subject_alternative_names = [format("*.%s", data.aws_route53_zone.covid-mgr.name)]
  validation_method         = "DNS"
}
