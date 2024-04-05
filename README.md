1. VPC 
2. Internet Gateway
3. 2 public subnet 
	1. az = us-east-1a
	2. az = us-east-1b
4. Public Route Table 
	1. attached = vpc
	2. attached = Internet Gateway 
	3. Route table association 
		subnet = public - us-east-1a
5. private App Subnet 
	1. az = us-east-1a -------- map public ip on launch = false 
	2. az = us-east-1b -------- map public ip on launch = false 
6. private DB subnet 
	1. az = us-east-1a -------- map public ip on launch = false 
	2. az = us-east-1b -------- map public ip on launch = false
7. Nat gateway 
	vpc = true 
	allocation id 
	subnet id = us-east-1b
8. private route table 
	vpc
	natgatway
9. app route association 
	1. subnet id = private app subnet 1
	2. route table id = private route table 

	1. subnet id = private app subnet 2
	2. route table id = private route table
10. DB route association 
	1. subnet id = private DB subnet 1
	2. route table id = private route table 

	1. subnet id = private DB subnet 2
	2. route table id = private route table
11. Securit group Load Balancer 
	1. http
	2. https 
	3. egress = 0 ( anywhere ) 
12. Security group for bastion host 
	1. ssh 
	2. egress
13. security group for presentation tier 
	1. http
	2. https 
	3. ssh 
	4. egress
14. security group for Database 
	1. mysql = 3306
	2. egress
15. Instance for web tier 
	1. subnet id = public web subent 1 
	2. vpc sg = webserver security group 
	3. user data = install-apache.sh
16. instance for app tier 
	1. subent id = private app subnet 1
	2. vpc sg = ssh-security-group ( bastion host )
17. Auto scaling group for presentation tier 
	1. image id 
	2. user data 
	3. instance type 
	4. subnet id = public web subnet 1 
	5. sg = webserver security group 
18. ASG for application tier 
	1. image id 
	2. instance type 
	3. subent id = private app subent 1
	4. sg = ssh security group 
19. web app load balancer 
	1. load balancer type = application
	2. sg = alb security group 
	3. subent = public web subent 1, public web subent 2
20. load balancer listener 
	1. load balancer arn = application load balancer
21. database subent group 
	1. subent id = private db subnet 1, private db subent 2
22. database instance 
	1. storage = 15gb
	2. engine = "mysql"
	3. db_name = "sqldb"
	4. username = "username"
	5. password = "password"
	6. skip snapshort = true
	7. az = us east 1b
	8. subent = database subent group
	9. sg = database security group 

