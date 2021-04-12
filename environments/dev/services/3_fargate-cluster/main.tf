#------------------------------------------------
# Resources
#------------------------------------------------
module "fargate_cluster" {

  source = "../../../../blueprints/services/3_fargate-cluster"

  env = var.env
  cluster_name = var.cluster_name
  cluster_tag = var.cluster_tag
  home_ip = var.home_ip
}