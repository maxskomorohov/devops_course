output "public_ec2_instance_id" {
  value = aws_instance.tf_public_ec2.public_ip
}

output "private_ec2_instance_id" {
  value = aws_instance.tf_public_ec2.private_ip
}