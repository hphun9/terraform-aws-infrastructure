variable "ami_id" {
  description = "AMI ID for the EC2 instances."
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances."
  type        = string
}

variable "public_subnet_id" {
  description = "The ID of the public subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "The ID of the private subnet."
  type        = string
}

variable "public_sg_id" {
  description = "The ID of the security group for the public instance."
  type        = string
}

variable "private_sg_id" {
  description = "The ID of the security group for the private instance."
  type        = string
}

# variable "key_name" {
#   description = "Key pair name to access the instances."
#   type        = string
# }

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}
