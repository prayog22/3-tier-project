resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc_01.id 

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.IGW.id}" 
  }

    tags = {
        Name = "public_route_table"
    }
  
}

resource "aws_route_table_association" "public-subnet-1-route-table-association" {
  subnet_id = aws_subnet.public-web-subnet-1.id
  route_table_id = aws_route_table.public_route_table.id
}

