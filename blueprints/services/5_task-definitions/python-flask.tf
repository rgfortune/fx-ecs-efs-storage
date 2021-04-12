#---------------------------------
# Python Flask App Access Point
#---------------------------------

# Python Flask Access Point
resource "aws_efs_access_point" "python_flask" {
  file_system_id = data.terraform_remote_state.fx_storage.outputs.fx_storage_id

  #forex user
  posix_user {
    uid = 1101
    gid = 1004
  }

  root_directory {
    path = "/python-flask"
  }

  tags = {
    "Name" = "Python Flask Repository"
  }
}