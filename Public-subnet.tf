resource "aws_subnet" "public-web-subnet-1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_web_subnet_1_cidr
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-web-subnet-1"
  }
}

resource "aws_subnet" "public-web-subnet-2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.public_web_subnet_2_cidr
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-web-subnet-2"
  }
}