#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "ecs_task_execution_role_arn" { value = module.iam.ecs_task_execution_role_arn }
output "ecs_task_role_arn" { value = module.iam.ecs_task_role_arn }

output "bastion_instance_profile" { value = module.iam.bastion_instance_profile }