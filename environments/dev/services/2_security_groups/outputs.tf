#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "bastion_sg" { value = module.security_groups.bastion_sg }
output "fx_task_sg" { value = module.security_groups.fx_task_sg }
output "efs_sg" { value = module.security_groups.efs_sg }