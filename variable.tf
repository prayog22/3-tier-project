variable "aws_access_key" {
  sensitive = true
}

variable "aws_secret_key" {
  sensitive = true
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  type = string
}

variable "public_web_subnet_1_cidr" {
  default = "10.0.1.0/24"
  type = string
}

variable "public_web_subnet_2_cidr" {
  default = "10.0.2.0/24"
  type = string
}

variable "private-app-subent-1-cidr_block" {
  default = "10.0.3.0/24"
  type = string
}

variable "private-app-subent-2-cidr_block" {
  default = "10.0.4.0/24"
  type = string
}

variable "private-db-subent-1-cidr_block" {
  default = "10.0.5.0/24"
  type = string
}

variable "private-db-subent-2-cidr_block" {
  default = "10.0.6.0/24"
  type = string
}

variable "ami_id" {
  default = "ami-0a699202e5027c10d"
  description = "Amazon linux 5.10"
  type = string
}

variable "key_name" {
  default = "Tools"
  type = string
}

variable "multi-az-deployment" {
  default     = false
  description = "Create a Standby DB Instance"
  type        = bool
}