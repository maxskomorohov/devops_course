module "instances" {
  source = "../modules/instances"

  vpc_id = var.vpc_id
  list_of_open_ports = var.list_of_open_ports
  repo_url = var.repo_url
}