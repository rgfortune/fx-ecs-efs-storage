#------------------------------------------------
# Resources
#------------------------------------------------
module "task_definitions" {

  source = "../../../../blueprints/services/5_task-definitions"

  region = var.region
  env = var.env

  # Task for Ricardo Fortune 
  rfortune_count = var.rfortune_count
}