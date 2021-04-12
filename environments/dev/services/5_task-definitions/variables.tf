#------------------------------------------------
# Variables
#------------------------------------------------

variable "rfortune_count" {
}
variable "region" {
  type        = string
  description = "e.g. eu-west-2"
}
variable "env" {
  type        = string
  description = "Environment"
}
variable "profile" {
  type        = string
}