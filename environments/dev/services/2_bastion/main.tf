#------------------------------------------------
# Resources
#------------------------------------------------

module "bastion" {
  source = "../../../../blueprints/services/2_bastion"

  # VPC Variables
  env          = var.env

  # EC2 Variables
  key_name     = var.key_name
  bastion_ami  = var.bastion_ami
  bastion_type = var.bastion_type
  region       = var.region

  # Security Group Variables
  home_ip      = var.home_ip
}