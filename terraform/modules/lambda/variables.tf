variable "aws_region" {}

variable "repo_dir" {}

variable "DB_PASSWORD" {}

variable "DB_HOST_ADDRESS" {}

variable "security_group_ids" {
  type ="list"
}

variable "subnet_ids" {
  type ="list"
}
