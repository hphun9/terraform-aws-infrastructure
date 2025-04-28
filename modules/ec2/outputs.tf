output "public_instance_id" {
  description = "The ID of the Public EC2 Instance."
  value       = aws_instance.public.id
}

output "public_instance_public_ip" {
  description = "The Public IP of the Public EC2 Instance."
  value       = aws_instance.public.public_ip
}

output "private_instance_id" {
  description = "The ID of the Private EC2 Instance."
  value       = aws_instance.private.id
}

output "private_instance_private_ip" {
  description = "The Private IP of the Private EC2 Instance."
  value       = aws_instance.private.private_ip
}
