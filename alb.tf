resource "aws_lb" "main_alb" {
  name               = "devops-project-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id] 

  subnets            = [
    aws_subnet.public_subnet_1.id, 
    aws_subnet.public_subnet_2.id
  ]

  enable_deletion_protection = false 

  tags = {
    Environment = "Project_Alb"
  }
}

resource "aws_lb_target_group" "main_target" {
  name     = "devops-project-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
  
  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200-399" 
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "main_listener" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_target.arn
  }
}