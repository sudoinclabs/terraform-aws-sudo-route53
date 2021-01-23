output "this_zone_id" {
  description = "Hosted Zone ID for Route53 Zone"
  value       = aws_route53_zone.this.zone_id
}
