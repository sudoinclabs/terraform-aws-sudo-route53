

resource "aws_route53_zone" "this" {
  name          = var.zone_name
  comment       = var.comment
  force_destroy = false

  tags = var.tags
}

resource "aws_route53_record" "ns" {
  allow_overwrite = true
  zone_id         = aws_route53_zone.this.zone_id
  name            = var.zone_name
  type            = "NS"
  ttl             = "172800"
  records         = aws_route53_zone.this.name_servers
}

module "route53_record" {
  source   = "./modules/records"
  for_each = var.records

  zone_id   = aws_route53_zone.this.zone_id
  zone_name = var.zone_name
  type      = upper(each.key)
  records   = each.value
}