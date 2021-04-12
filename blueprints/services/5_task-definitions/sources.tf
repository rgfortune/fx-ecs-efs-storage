#------------------------------------------------
# VPC Module State Reference
#------------------------------------------------

data "terraform_remote_state" "vpc" {
  backend = "local"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    path = "${path.module}/../../../environments/${var.env}/vpc/terraform.tfstate"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}


#------------------------------------------------
# EFS State Reference
#------------------------------------------------

data "terraform_remote_state" "fx_storage" {
  backend = "local"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    path = "${path.module}/../../../environments/${var.env}/services/4_efs-fx-storage/terraform.tfstate"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}


#------------------------------------------------
# IAM State Reference
#------------------------------------------------

data "terraform_remote_state" "iam" {
  backend = "local"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    path = "${path.module}/../../../environments/${var.env}/services/1_iam/terraform.tfstate"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}