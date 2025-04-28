variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "internet_gateway_id" {
  description = "The ID of the Internet Gateway for public route table."
  type        = string
}

variable "nat_gateway_id" {
  description = "The ID of the NAT Gateway for private route table."
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

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}
