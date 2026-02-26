resource "aws_route53_zone" "main_r53" {
  name = var.domain_name
}

resource "aws_route53_record" "main_record" {
  zone_id = aws_route53_zone.main_r53.zone_id
  name    = var.domain_name
  type    = "A" 

  alias {
    name                   = aws_lb.main_alb.dns_name
    zone_id                = aws_lb.main_alb.zone_id
    evaluate_target_health = true
  }
}