module "network" {
  source = "../../modules/network" # or from GIT (branch / tag ...)

  env = var.env
  aws_region = var.aws_region
  vpc_cidr = var.vpc_cidr
  subnets_cidr = var.subnets_cidr
}

module "compute" {
  source = "../../modules/compute"

  env = var.env
  vpc_id = module.network.vpc_id
  subnets_cidr = var.subnets_cidr
  subnet_ids = module.network.public_subnets
  ebs_size = var.ebs_size
  instance_type = var.instance_type
  keypair_name = var.keypair_name

}