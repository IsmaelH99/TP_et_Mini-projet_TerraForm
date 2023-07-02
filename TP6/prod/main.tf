provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "../ec2module"

  access_key       = "AKIA56SEMSCY6V3SUKRY"  # Remplacez par vos propres clés d'accès AWS
  secret_key       = "6ofp1wHTYVKvnXjt2iXDLf7rcMiyfCQZ7SiRVdng"  # Remplacez par vos propres clés d'accès AWS
  region           = "us-east-1"  # Remplacez par la région AWS souhaitée
  ami_id           = "ami-06b09bfacae1453cb"
  instance_type    = "t2.micro"
  key_name         = "devops-sabri"
  Name             = "ec2-sabri"
  security_group_name = "security-group"  # Add this line
  private_key_path = "/home/sabri/tp-2/pem/devops-sabri.pem"  # Remplacez par le chemin vers votre clé privée AWS
  environment = "prod"
}

output "public_ip" {
  value = module.ec2.public_ip
}

output "instance_id" {
  value = module.ec2.instance_id
}

output "availability_zone" {
  value = module.ec2.availability_zone
}
