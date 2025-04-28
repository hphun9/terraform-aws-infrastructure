# Public EC2 Instance
resource "aws_instance" "public" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [var.public_sg_id]
  associate_public_ip_address = true
  # key_name                    = var.key_name

  tags = {
    Name = "${var.name_prefix}_public_ec2"
  }
}

# Private EC2 Instance
resource "aws_instance" "private" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_id
  vpc_security_group_ids      = [var.private_sg_id]
  associate_public_ip_address = false
  # key_name                    = var.key_name

  tags = {
    Name = "${var.name_prefix}_private_ec2"
  }
}
