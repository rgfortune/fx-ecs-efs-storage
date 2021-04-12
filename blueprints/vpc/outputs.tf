#------------------------------------------- 
# VPC Outputs 
#------------------------------------------- 

output "vpc_id" { value = module.vpc.vpc_id }
output "vpc_cidr_block" { value = module.vpc.vpc_cidr_block }

output "env" { value = module.vpc.env }

output "aws_subnet_publicAzA_id" { value = module.vpc.aws_subnet_publicAzA_id }
output "aws_subnet_publicAzB_id" { value = module.vpc.aws_subnet_publicAzB_id }

output "aws_subnet_privateAzA_id" { value = module.vpc.aws_subnet_privateAzA_id }
output "aws_subnet_privateAzB_id" { value = module.vpc.aws_subnet_privateAzB_id }
