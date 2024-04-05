resource "aws_eip" "eip_nat" {
  domain = "vpc" 

  tags = {
    Name = "eip_nat"
  }
}


resource "aws_nat_gateway" "nat-1" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id = aws_subnet.public-web-subnet-2.id

  tags = {
    Name = "nat-1"
  }
}

