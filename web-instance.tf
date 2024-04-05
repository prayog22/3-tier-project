####### EC2 Instance for web tier

resource "aws_instance" "PublicWebTemplaet" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public-web-subnet-1.id
  vpc_security_group_ids = [ aws_security_group.webserver-security-group.id ]
  key_name = var.key_name
  user_data = file("install-apache.sh")

  tags = {
    Name = "web server ASg"
  }

}

##### EC2 Instance for app tier 

resource "aws_instance" "PrivateAppTemplate" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.private-app-subent-1.id 
  vpc_security_group_ids = ["${aws_security_group.ssh-security-group.id}"]
  key_name = var.key_name

  tags = {
    Name = "app server ASg"
  }
  
}