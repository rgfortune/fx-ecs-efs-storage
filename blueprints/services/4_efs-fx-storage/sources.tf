#------------------------------------------------
# VPC Module State Reference
#------------------------------------------------

data "terraform_remote_state" "vpc" {
  backend = "s3"

  # Paths are relative to the calling module.
  # Making it relative to the root module for readability

  config = {
    bucket = "ecs-fx-tfstate"
    key    = "ecs-fx-vpc.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}

#------------------------------------------------
# Fargate Cluster State Reference
#------------------------------------------------

data "terraform_remote_state" "fargate_cluster" {
  backend = "s3"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    bucket = "ecs-fx-tfstate"
    key    = "ecs-fx-fargate_cluster.terraform.tfstate"
    region = "us-east-1"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}