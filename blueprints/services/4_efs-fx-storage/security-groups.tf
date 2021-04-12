#----------------------------------
# EFS Security Group
#----------------------------------

resource "aws_security_group" "efs" {
  name        = "EFS access"
  description = "Allow EFS inbound traffic"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "EFS access from VPC"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.vpc_cidr_block]
  }

  ingress {
    description = "EFS access from task containers"
    from_port   = 2049
    to_port     = 2049
    protocol    = "tcp"
    security_groups = [data.terraform_remote_state.fargate_cluster.outputs.fx_task_sg]
  }

  tags = {
    Name = "EFS access"
  }
}