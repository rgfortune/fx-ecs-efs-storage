#----------------------------------
# Bastion
#----------------------------------

resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = var.bastion_type
  key_name                    = var.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.aws_subnet_publicAzA_id
  iam_instance_profile        = data.terraform_remote_state.iam.outputs.bastion_instance_profile
  vpc_security_group_ids      = [data.terraform_remote_state.security_groups.outputs.bastion_sg]
  associate_public_ip_address = true
  lifecycle {
    ignore_changes = [
      associate_public_ip_address
    ]
  }
  tags = {
    Name = "bastion"
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = "20"
  }

}
