data "aws_route53_zone" "covid-mgr" {
  name = "covid-mgr.com"
}
resource "aws_route53_record" "covid-mgr" {
  zone_id = data.aws_route53_zone.covid-mgr.zone_id
  name    = data.aws_route53_zone.covid-mgr.name
  type    = "A"

  alias {
    name                   = aws_lb.lb.dns_name
    zone_id                = aws_lb.lb.zone_id
    evaluate_target_health = true
  }
}
