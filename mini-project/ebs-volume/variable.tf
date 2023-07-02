variable "availability_zone" {
  description = "Availability zone where the EBS volume will be created"
}

variable "volume_size" {
  description = "Size of the EBS volume (in GB)"
  default     = 10
}

variable "volume_name" {
  description = "Name tag for the EBS volume"
}

variable "aws_region" {
  description = "AWS region where the EBS volume will be created"
  default     = "us-east-1"
}
