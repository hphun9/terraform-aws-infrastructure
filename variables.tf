variable "aws_region" {
  description = "AWS Region"
  default     = "ap-southeast-1"
}

variable "ec2_ami" {
  description = "EC2 AMI"
  default = ""
}

variable "ec2_instance_type" {
  description = "EC2 Instance Type"
  default = "t3.micro"
}

variable "prefix_tag_name" {
  description = "Prefix tag name for resources"
  default = "cnmeow"
}

variable "allowed_ip" {
  description = "Your trusted IP for SSH access in CIDR format (example: 1.2.3.4/32)."
  type        = string
}