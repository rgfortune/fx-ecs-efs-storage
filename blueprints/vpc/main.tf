#------------------------------------------------
# VPC
#
# Module Sources:
#
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc_basic-module.git
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc-module.git
#------------------------------------------------


module "vpc" {
  source = "git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc_basic-module.git"

  env      = var.env
  vpc_name = var.vpc_name
  cidr     = var.cidr
  region   = var.region
}