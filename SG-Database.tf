resource "aws_security_group" "database-security-group" {
  name = "database server security group"
  description = "Enable MYSQL access on port 3306"
  vpc_id = aws_vpc.vpc_01.id

  ingress  {
    description = "MYSQL"
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.webserver-security-group.id}"]

  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "database server security group"
  }
}
