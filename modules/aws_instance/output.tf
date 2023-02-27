output "ec2_instance_id" {
  value = aws_instance.ec2_instance.id
}

output "ec2_instance_host" {
  description = "Retreive Instance public DNS Name"
  value       = aws_instance.ec2_instance.public_dns
}