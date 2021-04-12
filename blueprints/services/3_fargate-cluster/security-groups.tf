#------------------------------------------- 
# FX Task Security Groups 
#------------------------------------------- 

resource "aws_security_group" "fx_task" {
  name        = "FX-Task"
  description = "Allow HTTP(S) access to FX tasks"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "HTTP from home"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }

  ingress {
    description = "HTTPS from home"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.home_ip]
  }

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