variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 Key Pair to use"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet to deploy the EC2 instance"
  type        = string
}

variable "ebs_volume_size" {
  description = "Size of the EBS volume (in GB) to attach to the EC2 instance"
  type        = number
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
}

variable "aws_region" {
  description = "AWS region where the EC2 instance will be deployed"
  default     = "us-east-1"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

