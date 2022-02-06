#------------------------------------------------
# VPC
#
# Module Sources:
#
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc_basic-module.git
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc-module.git
#
# https://github.com/rgfortune/terraform-basic-vpc-module.git
#------------------------------------------------


module "vpc" {
  source = "https://github.com/rgfortune/terraform-basic-vpc-module.git"

  env      = var.env
  vpc_name = var.vpc_name
  cidr     = var.cidr
  region   = var.region
}