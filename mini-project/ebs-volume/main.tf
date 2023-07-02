provider "aws" {
  region = var.aws_region
}

resource "aws_ebs_volume" "ebs" {
  availability_zone = var.availability_zone
  size              = var.volume_size
  tags = {
    Name = var.volume_name
  }
}
