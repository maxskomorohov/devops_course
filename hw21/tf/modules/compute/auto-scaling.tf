resource "aws_autoscaling_group" "main" {
  name = "${local.name_prefix}-asg"
  vpc_zone_identifier = var.subnet_ids

  desired_capacity   = 2
  min_size           = 1
  max_size           = 2

  launch_template {
    id      = aws_launch_template.runner.id
    version = aws_launch_template.runner.latest_version
  }
}
