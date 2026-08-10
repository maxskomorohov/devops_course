locals {
  ansible_hosts = {
    for index, ip in sort(module.compute.asg_instance_public_ips) :
    "nginx-${index + 1}" => {
      ansible_host = ip
      ansible_ssh_private_key_file = "/Users/maksym/.ssh/main-keypair.pem"
      ansible_user = "ubuntu"
    }
  }
}

resource "local_file" "ansible_inventory" {
  filename = abspath("${path.root}/../../../ansible/inventory.yaml")

  content = yamlencode({
    all = {
      hosts = local.ansible_hosts
    }
  })
}