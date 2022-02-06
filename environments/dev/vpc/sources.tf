#------------------------------------------------
# Provider
#------------------------------------------------

provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket = "ecs-fx-tfstate"
    key    = "ecs-fx-vpc.terraform.tfstate"
    region = "us-east-1"
  }
}