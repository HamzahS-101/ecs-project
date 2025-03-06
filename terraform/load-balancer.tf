resource "aws_lb" "tc-lb" {
    name = "threat-composer-alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb_sg.id]
    subnets = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}

resource "aws_lb_listener" "http-listener" {
  load_balancer_arn = aws_lb.tc-lb.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.ecs-tg.arn
    }
}