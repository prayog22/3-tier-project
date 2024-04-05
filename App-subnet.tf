resource "aws_subnet" "private-app-subent-1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private-app-subent-1-cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-app-subent-1 | App tier"
  }
}

resource "aws_subnet" "private-app-subent-2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private-app-subent-2-cidr_block
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-app-subent-2 | App tier"
  }
}