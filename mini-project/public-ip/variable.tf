variable "ip_name" {
  description = "Name tag for the Elastic IP"
}

variable "aws_region" {
  description = "AWS region where the Elastic IP and security group will be created"
  default     = "us-east-1"
}
