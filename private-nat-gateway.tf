resource "aws_route_table" "private-route-table" {
  vpc_id = aws_vpc.vpc_01.id

  route  {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-1.id 

  }

    tags = {
      Name = "private-route-table"
    }
  
}

