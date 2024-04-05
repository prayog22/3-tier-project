resource "aws_subnet" "private-db-subnet-1" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private-db-subent-1-cidr_block
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-db-subnet-1 | DB Tier" 
  }
}

resource "aws_subnet" "private-db-subnet-2" {
  vpc_id = aws_vpc.vpc_01.id
  cidr_block = var.private-db-subent-2-cidr_block
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "private-db-subnet-2 | DB Tier" 
  }
}