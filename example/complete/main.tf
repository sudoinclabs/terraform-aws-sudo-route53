provider "aws" {
  region = "us-east-1"
}

module "route53" {
  source = "../../"

  zone_name = "sudo.inc"
  comment   = "Managed by SUDO - Terraform."

  records = {
    mx = {
      "@" = {
        ttl = 300
        value = [
          "10 mail.sudo.inc",
        ]
      }
    }
    txt = {
      "@" = {
        value = [
          "v=spf1 +mx ~all",
        ]
      }
      "subdomain.sudo.inc" = {
        value = [
          "v=spf1 include:sudo.inc ~all"
        ]
      }
    }
    a = {
      "@"   = { value = ["10.1.1.1"] },
      "dev" = { value = ["10.2.3.4", "10.2.3.5"] },
    }
    cname = {
      "mail" = { value = ["sudo.inc"] },

    }
    alias = {
      "www" = { alias = { name = "sudo.inc" } },
    }
  }
  tags = {
    Name = "sudo.inc"
  }
}
