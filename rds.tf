##### database subent group

resource "aws_db_subnet_group" "database-subent-group" {
  name = "database-subent"
  subnet_ids = [aws_subnet.private-db-subnet-1.id, aws_subnet.private-db-subnet-2.id]
  description = "subent group for database instance"

  tags = {
    Name = "database-subent"
  }
}


###### Database instance 

resource "aws_db_instance" "database" { 
  allocated_storage = 15
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"
  db_name = "sqldb"
  username = "mydbinstance358"
  password = "#Mysql123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
  availability_zone = "us-east-1b"
  db_subnet_group_name = aws_db_subnet_group.database-subent-group.name
  multi_az = var.multi-az-deployment
  vpc_security_group_ids = [aws_security_group.database-security-group.id]
}