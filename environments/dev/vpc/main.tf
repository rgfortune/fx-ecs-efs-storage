#------------------------------------------------
# Resources
#------------------------------------------------

module "vpc" {
  source = "../../../blueprints/vpc"

  vpc_name = var.vpc_name
  cidr     = var.cidr
  region   = var.region
  env      = var.env
}