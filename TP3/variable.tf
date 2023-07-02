variable "instance_type" {
  type    = string
  default = "t2.nano"
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
