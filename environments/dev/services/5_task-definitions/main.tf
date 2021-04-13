#------------------------------------------------
# Resources
#------------------------------------------------
module "task_definitions" {

  source = "../../../../blueprints/services/5_task-definitions"

  region = var.region
  env = var.env

  # FX Users - Each user map creates a task and SNS topic/subscription
  users    = {
    rfortune = "ricardo.g.fortune@gmail.com"
  }
}