variable "vpc_id" {
  description = "The ID of the VPC."
  type        = string
}

variable "allowed_ip" {
  description = "Your trusted IP for SSH access in CIDR format (example: 1.2.3.4/32)."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}
