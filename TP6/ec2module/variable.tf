variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "Name" {
  type = string
  default = "ec2-sabri"
}

variable "key_name" {
  type = string
  default = "devops-sabri"
}

variable "create_security_group_rule" {
  type    = bool
  default = true
}

variable "region" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "environment" {
  type = string
}
