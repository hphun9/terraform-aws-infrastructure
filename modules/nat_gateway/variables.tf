variable "public_subnet_id" {
  description = "The ID of the public subnet where NAT Gateway will be deployed."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}
