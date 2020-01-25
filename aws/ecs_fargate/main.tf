resource "aws_ecs_cluster" "main" {
  name = var.name
}

resource "aws_ecs_task_definition" "main" {
  family                   = "main"
  cpu                      = var.cpu
  memory                   = var.memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = var.container_definitions
  execution_role_arn       = var.execution_role_arn
}

resource "aws_ecs_service" "main" {
  name                               = var.name
  cluster                            = aws_ecs_cluster.main.arn
  task_definition                    = aws_ecs_task_definition.main.arn
  desired_count                      = 2
  launch_type                        = "FARGATE"
  platform_version                   = "1.3.0"
  health_check_grace_period_seconds  = 60

  network_configuration {
    assign_public_ip = false
    security_groups = [var.security_group_id]

    subnets = var.private_subnet_ids
  }

  load_balancer {
    target_group_arn = var.aws_lb_target_group_arn
    container_name   = var.name
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [task_definition]
  }

  depends_on = [var.aws_lb_listener_rule]
}
