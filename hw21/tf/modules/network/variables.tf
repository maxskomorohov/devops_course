variable "env" {}

variable "aws_region" {}

variable "vpc_cidr" {}

variable "subnets_cidr" {}

variable "public_subnet_assign_public_ip" {
  description = "Assign public IP to public subnets on launch"
  default = true
}