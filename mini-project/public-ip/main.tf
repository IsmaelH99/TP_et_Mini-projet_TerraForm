provider "aws" {
  region = var.aws_region
}

resource "aws_eip" "public_ip" {
  vpc = true

  tags = {
    Name = var.ip_name
  }
}

module "ec2_instance" {
  source      = "../ec2-instance"
  instance_name   = var.instance_name
  key_name        = var.key_name
  subnet_id       = var.subnet_id
  ebs_volume_size = var.ebs_volume_size
  instance_type   = var.instance_type
}

resource "aws_security_group" "public_ip_sg" {
  name_prefix = "public-ip-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "public_ip_sg_egress" {
  security_group_id = aws_security_group.public_ip_sg.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "public_ip_sg_ingress" {
  security_group_id = aws_security_group.public_ip.id

  type        = "ingress"
  from_port   = 0
  to_port     = 65535
  protocol    = "tcp"
  cidr_blocks = [module.ec2_instance.instance_public_ip]
}

output "public_ip" {
  value = aws_eip.public_ip.public_ip
}

