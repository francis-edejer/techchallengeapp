data "aws_ecs_cluster" "default" {
  cluster_name = var.ecs_cluster
}

resource "aws_ecs_service" "default" {
  name            = var.project_name
  cluster         = data.aws_ecs_cluster.default.id
  task_definition = aws_ecs_task_definition.default.arn
  desired_count   = var.desired_count
  network_configuration {
    subnets         = [var.task_subnet]
    security_groups = [aws_security_group.default.id]
  }

  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 100

  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }

  service_registries {
    registry_arn = aws_service_discovery_service.default.arn
  }
}
