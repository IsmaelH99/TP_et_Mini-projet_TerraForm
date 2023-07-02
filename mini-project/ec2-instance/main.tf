provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ec2" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = var.ebs_volume_size
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "echo ${aws_instance.ec2.public_ip} > ip_ec2-projet.txt",
    ]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

output "instance_public_ip" {
  value = aws_instance.ec2.public_ip
}

