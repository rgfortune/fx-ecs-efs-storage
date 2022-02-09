#----------------------------------
# EFS Storage (Docker/ECS Volumes)
#----------------------------------

resource "aws_efs_file_system" "fx_storage" {
  creation_token = "fx-storage"
  encrypted      = true

  tags = {
    Name = "FX Storage Volume"
  }
}

#------------------------------
# Mount Targets               
#------------------------------

resource "aws_efs_mount_target" "privateAzA" {
  file_system_id  = aws_efs_file_system.fx_storage.id
  subnet_id       = data.terraform_remote_state.vpc.outputs.aws_subnet_privateAzA_id
  security_groups = [aws_security_group.efs.id]
}

resource "aws_efs_mount_target" "privateAzB" {
  file_system_id  = aws_efs_file_system.fx_storage.id
  subnet_id       = data.terraform_remote_state.vpc.outputs.aws_subnet_privateAzB_id
  security_groups = [aws_security_group.efs.id]
}
