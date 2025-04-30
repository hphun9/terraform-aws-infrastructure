module "vpc" {
  source      = "./modules/vpc"
  vpc_cidr    = "10.0.0.0/16"
  name_prefix = var.prefix_tag_name
}

module "subnet" {
  source              = "./modules/subnet"
  vpc_id              = module.vpc.vpc_id
  name_prefix         = var.prefix_tag_name
  public_subnet_cidr  = "10.0.1.0/24"
  private_subnet_cidr = "10.0.2.0/24"
  availability_zone   = var.aws_region
}

module "internet_gateway" {
  source      = "./modules/internet_gateway"
  vpc_id      = module.vpc.vpc_id
  name_prefix = var.prefix_tag_name
}

module "nat_gateway" {
  source            = "./modules/nat_gateway"
  public_subnet_id  = module.subnet.public_subnet_id
  name_prefix       = var.prefix_tag_name
}

module "route_table" {
  source              = "./modules/route_table"
  vpc_id              = module.vpc.vpc_id
  internet_gateway_id = module.internet_gateway.internet_gateway_id
  nat_gateway_id      = module.nat_gateway.nat_gateway_id
  public_subnet_id    = module.subnet.public_subnet_id
  private_subnet_id   = module.subnet.private_subnet_id
  name_prefix         = var.prefix_tag_name
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id      = module.vpc.vpc_id
  allowed_ip  = var.allowed_ip
  name_prefix = var.prefix_tag_name
}

module "ec2" {
  source             = "./modules/ec2"
  ami_id             = var.ec2_ami
  instance_type      = var.ec2_instance_type
  public_subnet_id   = module.subnet.public_subnet_id
  private_subnet_id  = module.subnet.private_subnet_id
  public_sg_id       = module.security_group.public_sg_id
  private_sg_id      = module.security_group.private_sg_id
  name_prefix        = var.prefix_tag_name
}
