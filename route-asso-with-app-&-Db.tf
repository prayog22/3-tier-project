##### route assoc. for app tier ###

resource "aws_route_table_association" "nat-route-1" {
  subnet_id = aws_subnet.private-app-subent-1.id
  route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "nat-route-2" {
    subnet_id = aws_subnet.private-app-subent-2.id 
    route_table_id = aws_route_table.private-route-table.id
}

######### Route assoc. for db tier ##########

resource "aws_route_table_association" "nat-route-db-1" {
    subnet_id = aws_subnet.private-db-subnet-1.id
    route_table_id = aws_route_table.private-route-table.id
}

resource "aws_route_table_association" "nat-route-db-2" {
    subnet_id = aws_subnet.private-db-subnet-2.id
    route_table_id = aws_route_table.private-route-table.id
}

