#------------------------------------------------
# Resources
#------------------------------------------------

module "bastion" {
  source = "../../../../blueprints/services/3_bastion"

  # VPC Variables
  env = var.env

  # EC2 Variables
  key_name     = var.key_name
  bastion_ami  = var.bastion_ami
  bastion_type = var.bastion_type
  region       = var.region

}