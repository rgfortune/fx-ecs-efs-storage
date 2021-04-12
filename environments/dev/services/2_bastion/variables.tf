#------------------------------------------------
# Variables
#------------------------------------------------
variable "key_name" {
  type        = string
  description = "e.g. my-key"
}
variable "bastion_ami" {
  type        = string
  description = "Instance AMI"
}
variable "bastion_type" {
  type        = string
  description = "Instance type"
}
variable "region" {
  type        = string
  description = "Region"
}
variable "env" {
  type        = string
  description = "Environment"
}
variable "profile" {
  type        = string
}
variable "home_ip" {
  type        = string
  description = "Home IP Address"
}