resource "aws_ecs_task_definition" "tc-task-definition" {
    family = "threat-composer-td"
    requires_compatibilities = ["FARGATE"]
    network_mode = "awsvpc"
    cpu = 1024
    memory = 2048
    execution_role_arn = aws_iam_role.ecs-iam-role.arn
    
    runtime_platform {
        operating_system_family = "LINUX"
        cpu_architecture        = "X86_64"
    }

    container_definitions = jsonencode([
    {
        name = "docker-container"
        image = var.docker_image
        cpu = 1024
        memory = 2048
        essential = true 
        portMappings = [
            {
            containerPort = 3000
            hostPort = 3000
            protocol = "tcp"
            }
        ]
    }
   ])
}

        
