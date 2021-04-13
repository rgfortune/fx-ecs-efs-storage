#-------------------------------------
# App Logs and DB Data Access Points
#-------------------------------------

# Python Flask Logs Access Point
resource "aws_efs_access_point" "rfortune_flask_logs" {
  file_system_id = data.terraform_remote_state.fx_storage.outputs.fx_storage_id

  #forex user
  posix_user {
    uid = 1101
    gid = 1004
  }

  root_directory {
    path = "/rfortune/logs"
  }

  count = var.rfortune_count

  tags = {
    "Name" = "Python Flask Logs"
  }
}

# FX DB Access Point
resource "aws_efs_access_point" "rfortune_fx_db" {
  file_system_id = data.terraform_remote_state.fx_storage.outputs.fx_storage_id

  # mongodb user
  posix_user {
    uid = 888
    gid = 888
  }

  root_directory {
    path = "/rfortune/data/db"
  }

  count = var.rfortune_count

  tags = {
    "Name" = "FX DB Data Directory"
  }
}

#------------------------------
# Task Definition               
#------------------------------


resource "aws_ecs_task_definition" "rfortune-fx" {
  family                = "rfortune-FX"
  task_role_arn = data.terraform_remote_state.iam.outputs.ecs_task_role_arn
  execution_role_arn = data.terraform_remote_state.iam.outputs.ecs_task_execution_role_arn
  network_mode = "awsvpc"
  cpu = "1024"
  memory = "2048"
  requires_compatibilities = [ "FARGATE" ]
  count = var.rfortune_count
  container_definitions = <<DEFINITION
  [
      {
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/forex",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs",
            "awslogs-create-group": "true"
          }
        },
        "portMappings": [
          {
            "hostPort": 80,
            "protocol": "tcp",
            "containerPort": 80
          }
        ],
        "cpu": 0,
        "environment": [],
        "image": "444395806902.dkr.ecr.us-east-1.amazonaws.com/fx-reverse-proxy:ecs",
        "dependsOn": [
          {
            "containerName": "app",
            "condition": "START"
          }
        ],
        "name": "reverse-proxy"
      },
      {
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/forex",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs",
            "awslogs-create-group": "true"
          }
        },
        "cpu": 0,
        "environment": [
          {
            "name": "DBHOST",
            "value": "127.0.0.1"
          }
        ],
        "mountPoints": [
          {
            "readOnly": null,
            "containerPath": "/opt/flask/forex",
            "sourceVolume": "python-flask"
          },
          {
            "readOnly": null,
            "containerPath": "/opt/flask/forex/logs",
            "sourceVolume": "python-flask-logs"
          }
        ],
        "image": "444395806902.dkr.ecr.us-east-1.amazonaws.com/fx-app:latest",
        "dependsOn": [
          {
            "containerName": "fxdb",
            "condition": "START"
          }
        ],
        "name": "app"
      },
      {
        "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "/ecs/forex",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs",
            "awslogs-create-group": "true"
          }
        },
        "cpu": 0,
        "environment": [],
        "mountPoints": [
          {
            "readOnly": null,
            "containerPath": "/data/db",
            "sourceVolume": "fx-db"
          }
        ],
        "image": "mongo:4.0.14-xenial",
        "user": "888",
        "name": "fxdb"
      }
  ]
  DEFINITION

  volume {
    name = "python-flask"

    efs_volume_configuration {
      file_system_id          = data.terraform_remote_state.fx_storage.outputs.fx_storage_id
      transit_encryption      = "ENABLED"
      transit_encryption_port = 2999
      authorization_config {
        access_point_id = aws_efs_access_point.python_flask.id
        iam             = "ENABLED"
      }
    }
  }

  volume {
    name = "python-flask-logs"

    efs_volume_configuration {
      file_system_id          = data.terraform_remote_state.fx_storage.outputs.fx_storage_id
      transit_encryption      = "ENABLED"
      transit_encryption_port = 3999
      authorization_config {
        access_point_id = aws_efs_access_point.rfortune_flask_logs[count.index].id
        iam             = "ENABLED"
      }
    }
  }

  volume {
    name = "fx-db"

    efs_volume_configuration {
      file_system_id          = data.terraform_remote_state.fx_storage.outputs.fx_storage_id
      transit_encryption      = "ENABLED"
      transit_encryption_port = 4999
      authorization_config {
        access_point_id = aws_efs_access_point.rfortune_fx_db[count.index].id
        iam             = "ENABLED"
      }
    }
  }

  tags = {
    "Owner" = "Ricardo Fortune"
  }

}

#-------------------------------------
# SNS Subscriptions
#-------------------------------------

resource "aws_sns_topic" "rfortune_fx_orders" {
  name = "rfortune-fx-orders"
}

resource "aws_sns_topic_subscription" "rfortune_fx_orders" {
  topic_arn = aws_sns_topic.rfortune_fx_orders.arn
  protocol  = "email"
  endpoint  = "ricardo.g.fortune@gmail.com"
}