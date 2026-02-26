output "alb_dns_name" {
  value = aws_lb.main_alb.dns_name
}

output "route53_name_servers" {
  value = aws_route53_zone.main_r53.name_servers
}