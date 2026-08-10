locals {
  name_prefix = "hw21-${var.env}"
}

resource "aws_launch_template" "runner" {
  name = "${local.name_prefix}-lt"

  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  block_device_mappings {
    device_name = tolist(data.aws_ami.ubuntu.block_device_mappings)[0].device_name
    ebs {
      volume_size = var.ebs_size
      volume_type = "gp3"
    }
  }
  ebs_optimized = true


  vpc_security_group_ids = [
    aws_security_group.allow_ssh.id,
    aws_security_group.allow_http.id,
    aws_security_group.outbound_all.id
  ]

  key_name = var.keypair_name

  metadata_options {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 1
    instance_metadata_tags      = "enabled"
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${local.name_prefix}-ec2"
    }
  }
}