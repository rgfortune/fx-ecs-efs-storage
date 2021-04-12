#------------------------------------------------
# VPC Module State Reference
#------------------------------------------------

data "terraform_remote_state" "vpc" {
  backend = "local"

  # Paths are relative to the calling module.
  # Making it relative to the root module for readability

  config = {
    path = "${path.module}/../../../environments/${var.env}/vpc/terraform.tfstate"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}

#------------------------------------------------
# Fargate Cluster State Reference
#------------------------------------------------

data "terraform_remote_state" "fargate_cluster" {
  backend = "local"

  # Paths are relative to the calling/root module.
  # {path.module} - making the path relative to the module where the expression exists.

  config = {
    path = "${path.module}/../../../environments/${var.env}/services/3_fargate-cluster/terraform.tfstate"
  }

  # https://www.terraform.io/docs/language/expressions/references.html#path-module
  # https://www.terraform.io/docs/language/functions/file.html

}