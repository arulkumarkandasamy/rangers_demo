
variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
}

variable "enable_dns_support" {}

variable "enable_dns_hostnames" {}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
}

variable "private_subnet_cidr" {
    description = "CIDR for the Private Subnet"
}

variable "public_subnet_cidr_2" {
    description = "CIDR for the Public Subnet"
}

variable "private_subnet_cidr_2" {
    description = "CIDR for the Private Subnet"
}

variable "aws_key_name" {
    description = "Kay pair name"
}

variable "ins_ami" {}

variable "project_name" {
  default = "arul-demo"
}

variable "allow_all_cidr" {
  default = "0.0.0.0/0"
}

variable "region_1_az_1" {
  default = "eu-west-1a"
}

variable "region_1_az_2" {
  default = "eu-west-1b"
}

