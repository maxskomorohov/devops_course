resource "aws_instance" "hw20_ec2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3.micro"
  subnet_id                   = data.aws_subnets.public.ids[0]
  associate_public_ip_address = true
  vpc_security_group_ids = [
    aws_security_group.open_listed_ports.id
  ]
  key_name = "main-keypair"
  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required" # IMDSv2
  }

  user_data = templatefile("${path.module}/user-data.sh", {
    repo_url = var.repo_url
  })

  tags = {
    Name = "hw20-ec2"
  }
}