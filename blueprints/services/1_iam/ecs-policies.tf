#------------------------------------------
# ECS Task Roles
#------------------------------------------

resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
  path = "/"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_role" "ecs_task_role" {
  name = "ecsTaskRole"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "ecs-tasks.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}


# ECS task execution policy document
data "aws_iam_policy_document" "ecs_task_execution_policy" {
  statement {
    sid    = "ECSTaskExecution"
    effect = "Allow"
    actions = [
      "ecr:GetAuthorizationToken",
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "sns:Publish"
    ]
    resources = ["*"]
  }
}

# Create task execution IAM policy
resource "aws_iam_policy" "ecs_task_execution_policy" {
  name        = "ecs_task_execution_policy"
  path        = "/"
  description = "ECS Task Execution policy"
  policy      = data.aws_iam_policy_document.ecs_task_execution_policy.json
}

resource "aws_iam_policy_attachment" "ecs_task_execution_role_policy_attachment" {
  name       = "ecs_task_execution_attachment"
  roles      = [aws_iam_role.ecs_task_execution_role.name]
  policy_arn = aws_iam_policy.ecs_task_execution_policy.arn
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policy_attachment" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonElasticFileSystemClientFullAccess"
}