#------------------------------------------------
# Resources
#------------------------------------------------
module "efs-fx-storage" {

  source = "../../../../blueprints/services/4_efs-fx-storage"

  env = var.env
}