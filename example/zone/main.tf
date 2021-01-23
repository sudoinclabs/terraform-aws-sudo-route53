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
