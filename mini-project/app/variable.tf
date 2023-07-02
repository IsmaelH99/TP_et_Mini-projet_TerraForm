variable "aws_region" {
  description = "AWS region where the infrastructure will be deployed"
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
