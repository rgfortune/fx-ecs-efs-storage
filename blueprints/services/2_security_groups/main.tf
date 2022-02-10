#------------------------------------------- 
# EC2 Security Groups 
#------------------------------------------- 

resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Allow traffic to selected common ports"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion"
  }
}

#------------------------------------------- 
# FX Task Security Groups 
#------------------------------------------- 

resource "aws_security_group" "fx_task" {
  name        = "FX-Task"
  description = "Allow HTTP(S) access to FX tasks"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "FX-Task"
  }
}


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
    description     = "EFS access from task containers"
    from_port       = 2049
    to_port         = 2049
    protocol        = "tcp"
    security_groups = [aws_security_group.fx_task]
  }

  tags = {
    Name = "EFS access"
  }
}