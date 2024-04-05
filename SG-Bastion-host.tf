resource "aws_security_group" "ssh-security-group" {
  name = "SSH Access"
  description = "enable SSH access"
  vpc_id = aws_vpc.vpc_01.id

  ingress  {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress  {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "SSH Access"
  }

}