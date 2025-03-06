resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security group for ALB"
  vpc_id      = aws_vpc.tc-vpc.id

  tags = {
    Name = "alb-sg"
  }
}


resource "aws_vpc_security_group_ingress_rule" "alb_http_ingress" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 80
    to_port = 80
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "alb_https_ingress" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 443
    to_port = 443
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "alb_egress" {
    security_group_id = aws_security_group.alb_sg.id
    from_port = 0
    to_port = 0
    ip_protocol = "-1"
    cidr_ipv4 = "0.0.0.0/0"
}

resource "aws_security_group" "container_sg" {
  name        = "container-sg"
  description = "Security group for ECS tasks"
  vpc_id      = aws_vpc.tc-vpc.id

  tags = {
    Name = "container-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "container_ingress" {
  security_group_id      = aws_security_group.container_sg.id
  from_port              = 3000
  to_port                = 3000
  ip_protocol            = "tcp" 
  referenced_security_group_id = aws_security_group.alb_sg.id
}

resource "aws_vpc_security_group_egress_rule" "container_egress" {
  security_group_id = aws_security_group.container_sg.id
  from_port         = 0
  to_port           = 0
  ip_protocol       = "-1" 
  cidr_ipv4         = "0.0.0.0/0"
}