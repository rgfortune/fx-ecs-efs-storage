#----------------------------------
# ECS Clusters
#----------------------------------

resource "aws_ecs_cluster" "fx" {
  name = var.cluster_name
  capacity_providers = [ "FARGATE", "FARGATE_SPOT" ]
  setting {
    name = "containerInsights"
    value = "enabled"
  }
  tags = {
    "Name" = var.cluster_tag
  }
}