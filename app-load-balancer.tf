resource "aws_alb" "application-load-balancer" {
  name = "web-external-load-balancer"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb-security-group.id]
  subnets = [aws_subnet.public-web-subnet-1.id, aws_subnet.public-web-subnet-2.id]
  enable_deletion_protection = false

  tags = {
    Name = "app load baalncer"
  }
}

resource "aws_alb_target_group" "alb-target-group" {
  name = "appbalancertg"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.vpc_01.id
}

resource "aws_lb_target_group_attachment" "web-attachment" {
  target_group_arn = aws_alb_target_group.alb-target-group.arn
  target_id = aws_instance.PublicWebTemplaet.id
  port = 80 
}


############# create a listener on port 80 with redirect action

resource "aws_lb_listener" "alb_http_listner" {
  load_balancer_arn = aws_alb.application-load-balancer.arn
  port = 80
  protocol = "HTTP"

  default_action {
    type = "redirect"
    target_group_arn = aws_alb_target_group.alb-target-group.arn

    redirect {
      port = "443"
      protocol = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}