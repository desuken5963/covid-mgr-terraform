resource "aws_ecs_task_definition" "sample_task" {
  family                = "sample-webapp"
  container_definitions = jsonencode([
    {
      name  = "sample-webapp",
      image = "231200130686.dkr.ecr.ap-northeast-1.amazonaws.com/sample-image:latest",
      cpu   = 333,
      memoryReservation = 600,
      essential = true,
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 0
          protocol      = "tcp"
        }
      ],
      command = ["bundle", "exec", "rails", "s", "-p", "3000", "-b", "0.0.0.0"],
      logConfiguration = {
        logDriver = "awslogs",
        options = {
          "awslogs-group"         = var.awslogs_group
          "awslogs-region"        = var.awslogs_region
          "awslogs-stream-prefix" = var.awslogs_stream_prefix
        }
      },
      environment = [
        {
          name  = "RAILS_MASTER_KEY"
          value = var.rails_master_key
        },
        {
          name  = "RAILS_ENV"
          value = "production"
        },
        {
          name  = "DB_NAME"
          value = var.db_name
        },
        {
          name  = "DB_USER"
          value = var.db_user
        },
        {
          name  = "DB_PASSWORD"
          value = var.db_password
        },
        {
          name  = "DB_PORT"
          value = var.db_port
        },
        {
          name  = "DB_HOST"
          value = var.db_host
        }
      ]
    }
  ])

  task_role_arn = data.terraform_remote_state.aws_iam.outputs.ecs_task_role_arn
  network_mode  = "bridge"
}