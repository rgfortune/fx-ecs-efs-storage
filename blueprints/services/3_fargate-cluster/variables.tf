#------------------------------------------------
# Variables
#------------------------------------------------
variable "env" {
  type        = string
  description = "e.g. dev"
}
variable "cluster_name" {
  type        = string
  description = "Cluster name"
}
variable "cluster_tag" {
  type        = string
  description = "Tag - cluster name"
}
variable "home_ip" {
  type        = string
  description = "Home IP Address"
}
