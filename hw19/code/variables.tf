variable "aws_region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "192.168.0.0/20"
}

variable "subnets_cidr" {
  default = {
    public_a  = "192.168.0.0/24"
    public_b  = "192.168.1.0/24"
    private_a = "192.168.2.0/24"
    private_b = "192.168.3.0/24"
  }
}