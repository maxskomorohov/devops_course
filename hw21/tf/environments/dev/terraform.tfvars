# Project specs
env = "dev"
aws_region = "eu-central-1"

# Network
vpc_cidr = "192.168.0.0/20"
subnets_cidr = {
    public_a  = "192.168.0.0/24"
    public_b  = "192.168.1.0/24"
    private_a = "192.168.2.0/24"
    private_b = "192.168.3.0/24"
}

# EC2 Params
ebs_size = 20
instance_type = "t3.small"

# Keypair name
keypair_name = "main-keypair"