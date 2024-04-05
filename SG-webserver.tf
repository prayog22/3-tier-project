resource "aws_security_group" "webserver-security-group" {
  name = "web server security group"
  description = "enable http/https for port 80/443 via ALB and ssh"
  vpc_id = aws_vpc.vpc_01.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  
}
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb-security-group.id]
  
}
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb-security-group.id]
  
}
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb-security-group.id]
  }

  tags = {
    Name = "web server security group"
  }

}