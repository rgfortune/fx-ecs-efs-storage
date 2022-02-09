#------------------------------------------------
# VPC Module State Reference
#------------------------------------------------

#data "terraform_remote_state" "vpc" {
#  backend = "s3"
#
#  # Paths are relative to the calling/root module.
#  # {path.module} - making the path relative to the module where the expression exists.
#
#  config = {
#    bucket = "ecs-fx-tfstate"
#    key    = "ecs-fx-vpc.terraform.tfstate"
#    region = "us-east-1"
#  }
#
#  # https://www.terraform.io/docs/language/expressions/references.html#path-module
#  # https://www.terraform.io/docs/language/functions/file.html
#
#}


#------------------------------------------------
# EFS State Reference
#------------------------------------------------

data "terraform_remote_state" "fx_storage" {
  backend = "s3"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    bucket = "ecs-fx-tfstate"
    key    = "ecs-fx-efs.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}


#------------------------------------------------
# IAM State Reference
#------------------------------------------------

data "terraform_remote_state" "iam" {
  backend = "s3"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    bucket = "ecs-fx-tfstate"
    key    = "ecs-fx-iam.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}