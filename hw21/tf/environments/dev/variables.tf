variable "env" {
  type = string
  description = "Environment name for name suffix convention"
}

variable "aws_region" {}

variable "vpc_cidr" {}

variable "subnets_cidr" {}

variable "ebs_size" {}

variable "instance_type" {}

variable "keypair_name" {}