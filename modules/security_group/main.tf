# Security Group for Public EC2
resource "aws_security_group" "public_ec2" {
  name        = "${var.name_prefix}_sg_public_ec2"
  description = "Allow SSH from trusted IP."
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH access from trusted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ip]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}_sg_public_ec2"
  }
}

# Security Group for Private EC2
resource "aws_security_group" "private_ec2" {
  name        = "${var.name_prefix}_sg_private_ec2"
  description = "Allow SSH from Public EC2."
  vpc_id      = var.vpc_id

  ingress {
    description      = "SSH access from Public EC2"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.public_ec2.id]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.name_prefix}_sg_private_ec2"
  }
}
