provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA56SEMSCY6V3SUKRY"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
  ami           = "ami-06b09bfacae1453cb"
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.myec2.id]
  tags = {
    Name = var.Name
  }

    provisioner "local-exec" {
    command = "echo 'PUBLIC IP: ${aws_instance.myec2.public_ip} ; ID:${aws_instance.myec2.id} ; AZ: ${aws_instance.myec2.availability_zone}' > /home/sabri/tp-2/infos_ec2.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("/home/sabri/tp-2/pem/devops-sabri.pem")
      host        = self.public_ip
    }
  }
}

resource "aws_eip" "myec2" {
  vpc = true
}

resource "aws_security_group" "myec2" {
  name        = "security-group"
  description = "security group"

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

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eip_association" "myec2" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.myec2.id
}

