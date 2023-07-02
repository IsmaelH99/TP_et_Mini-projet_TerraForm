provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA56SEMSCYSWED2RS2"
  secret_key = "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"
}

module "ec2-dev-Ismael" {
  source = "../ec2module"
  instancetype = "t2.nano"
  namesg = "dev-sg-Ismael"
  aws_common_tag = {
    Name = "ec2-dev-Ismael"
  }
}
