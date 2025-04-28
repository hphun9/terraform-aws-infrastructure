variable "vpc_id" {
  description = "The ID of the VPC to attach the Internet Gateway."
  type        = string
}

variable "name_prefix" {
  description = "Prefix for naming resources."
  type        = string
}
