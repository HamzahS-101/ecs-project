resource "aws_ecs_service" "fargate-service" {
    name = "fargate-service"
    launch_type = "FARGATE"
    platform_version = "LATEST"
    cluster = aws_ecs_cluster.tc-cluster.id
    task_definition = aws_ecs_task_definition.tc-task-definition.arn
    desired_count = 3

    network_configuration {
        subnets = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
        security_groups = [aws_security_group.container_sg.id]
    }

    load_balancer {
        target_group_arn = aws_lb_target_group.ecs-tg.arn
        container_name = "docker-container"
        container_port = 3000
    }

    depends_on = [
        aws_lb_target_group.ecs-tg,
        aws_ecs_task_definition.tc-task-definition,
        aws_ecs_cluster.tc-cluster
    ]
}