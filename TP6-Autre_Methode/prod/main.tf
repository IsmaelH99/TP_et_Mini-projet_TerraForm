provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA56SEMSCYSWED2RS2"
  secret_key = "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"
}

module "ec2-prod-Ismael" {
  source = "../ec2module"
  instancetype = "t2.micro"
  namesg = "prod-sg-Ismael"
  aws_common_tag = {
    Name = "ec2-prod-Ismael"
  }
}
