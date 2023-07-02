provider "aws" {
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "ec2_instance" {
  source      = "../ec2-instance"
  instance_name   = "MyEC2Instance"
  key_name        = "my-keypair"
  subnet_id       = "subnet-12345678"
  ebs_volume_size = 20
  instance_type   = "t2.micro"
}

module "ebs_volume" {
  source           = "../ebs-volume"
  availability_zone = "us-east-1a"
  volume_size       = 20
  volume_name       = "MyEBSVolume"
}

module "public_ip" {
  source  = "../public-ip"
  ip_name = "MyElasticIP"
}

module "security_group" {
  source = "../security-group"
}

resource "null_resource" "nginx_installation" {
  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx",
      "echo ${module.public_ip.public_ip} > ip_ec2-projet.txt",
    ]
    connection {
      type        = "ssh"
      host        = module.ec2_instance.instance_public_ip
      user        = "ubuntu"
      private_key = file("/home/sabri/tp-2/pem/devops-sabri.pem") # Replace with the path to your private key
    }
  }

  depends_on = [module.ec2_instance]
}
