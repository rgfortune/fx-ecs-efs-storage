#------------------------------------------------
# VPC
#
# Module Sources:
#
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc_basic-module.git
# git::ssh://git@bitbucket_rgfortune/rgfortune/terraform-vpc-module.git
#
# github.com/rgfortune/terraform-basic-vpc-module
#------------------------------------------------


module "vpc" {
  source = "github.com/rgfortune/terraform-basic-vpc-module"

  env          = var.env
  vpc_name     = var.vpc_name
  cidr         = var.cidr
  region       = var.region
  project_name = var.project_name
  owner        = var.owner
}