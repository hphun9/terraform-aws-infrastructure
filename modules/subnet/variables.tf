variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet."
  type        = string
}

variable "availability_zone" {
  description = "AWS availability zone to deploy subnets (e.g. ap-southeast-1a)."
  type        = string
}
