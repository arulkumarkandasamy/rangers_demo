variable "aws_region" {
    description = "EC2 Region for the VPC"
}

variable "region_1_az_1" {
  default = "eu-west-1a"
}

variable "region_1_az_2" {
  default = "eu-west-1b"
}

variable "vpc_cidr" {
    type = "string"
}

variable "enable_dns_support" {
    type = "string"
}

variable "enable_dns_hostnames" {
    type = "string"
}

variable "ins_ami" {
    description = "AMIs by region"
}

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

variable "email_address" {
    description = "Email Address"
}

variable "repo_dir" {}

variable "project_name" {}

variable "db_password" {}

variable "aws_key_name" {}

variable "access_key" {}

variable "secret_key" {}





