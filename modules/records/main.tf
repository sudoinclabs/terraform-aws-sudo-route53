locals {
  records = var.enabled == true ? var.records : {}
}

resource "aws_route53_record" "this" {
  for_each = local.records

  allow_overwrite = true
  zone_id         = var.zone_id
  name            = each.key == "@" ? var.zone_name : "${each.key}.${var.zone_name}"
  type            = lower(var.type) != "alias" ? upper(var.type) : "A"
  records         = lower(var.type) != "alias" ? each.value.value : null
  ttl             = lower(var.type) != "alias" ? lookup(each.value, "ttl", var.ttl) : null

  dynamic "alias" {
    for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]

    content {
      name                   = each.value.alias.name
      zone_id                = lookup(each.value.alias, "zone_id", var.zone_id)
      evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", false)
    }
  }
}