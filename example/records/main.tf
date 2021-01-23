provider "aws" {
  region = "us-east-1"
}

module "route53" {
  source = "../../"

  zone_name = "sudo.inc"
  comment   = "Managed by SUDO - Terraform."

  tags = {
    Name = "sudo.inc"
  }
}

module "route53_record" {
  source = "../../modules/records"

  zone_id   = module.route53.this_zone_id
  zone_name = "sudo.inc"
  type      = "MX"
  records = {
    "@" = {
      ttl = 300
      value = [
        "10 mail.sudo.inc",
      ]
    }
  }
}