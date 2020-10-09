resource "aws_cloudwatch_log_group" "default" {
  retention_in_days = 90
  name              = "/ecs/${var.project_name}"

  tags = {
    project = var.project_name
  }
}

resource "aws_ecs_task_definition" "default" {
  family        = var.project_name
  task_role_arn = aws_iam_role.default.arn
  cpu           = var.task_cpu
  memory        = var.task_memory
  network_mode  = "awsvpc"

  container_definitions = <<DEFINITION
[
  {
    "name": "${var.project_name}",
    "logConfiguration": {
       "logDriver": "awslogs",
       "secretOptions": null,
       "options": {
         "awslogs-group": "${aws_cloudwatch_log_group.default.name}",
         "awslogs-region": "us-east-1",
         "awslogs-stream-prefix": "ecs"
       }
     },
    "image": "${var.docker_repo}/${var.project_name}:${var.release_version}",
    "essential": true,
    "environment": [
        {
          "name": "VTT_DBHOST",
          "value": "${aws_db_instance.default.address}"
        },
        {
          "name": "VTT_DBPORT",
          "value": "${aws_db_instance.default.port}"
        },
        {
          "name": "VTT_DBUSER",
          "value": "${aws_db_instance.default.username}"
        },
        {
          "name": "VTT_DBPASSWORD",
          "value": "${data.vault_generic_secret.db.data["password"]]}"
        },
        {
          "name": "VTT_DBBNAME",
          "value": "${aws_db_instance.default.name]}"
        },
        {
          "name": "VTT_LISTENHOST",
          "value": "${var.listenhost}"
        },
        {
          "name": "VTT_LISTENPORT",
          "value": "${var.listenport}"
        }
    ],
    "portMappings": [
        {
          "containerPort": ${var.listenport}
        }
    ]
  }
]
DEFINITION

  tags = {
    project = var.project_name
  }
}
