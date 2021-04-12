#------------------------------------------- 
# EC2 Security Groups 
#------------------------------------------- 

resource "aws_security_group" "bastion" {
  name        = "bastion"
  description = "Allow traffic to selected common ports"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    description = "SSH from home"
    from_port   = 22
    to_port     = 22
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
    Name = "Bastion"
  }
}