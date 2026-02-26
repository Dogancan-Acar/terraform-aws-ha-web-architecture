variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "domain_name" {
  type    = string
  default = "2dd.space"
}

variable "alarm_email" {
  type    = string
  default = "ornek@mail.com" 
}