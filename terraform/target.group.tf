resource "aws_lb_target_group" "ecs-tg" {
  name        = "ecs-target-group"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = aws_vpc.tc-vpc.id
}

