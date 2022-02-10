#------------------------------------------- 
# Outputs 
#------------------------------------------- 

output "bastion_sg" { value = aws_security_group.bastion.id }
output "fx_task_sg" { value = aws_security_group.fx_task.id }
output "efs_sg" { value = aws_security_group.efs.id }
