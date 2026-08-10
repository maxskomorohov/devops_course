output "asg_instance_public_ips" {
  description = "List of active EC2 instance IDs in the ASG"
  value       = data.aws_instances.asg_instances.public_ips
}