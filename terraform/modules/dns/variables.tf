variable "vpc_cidr" {}
variable "zone_id" {}

variable "apache_public_dns" {}
variable "jiraconfluence_private_dns" {}
variable "bastion_public_dns" {}

variable "elb_dns_name" {}
variable "elb_zone_id" {}

variable "apache-jira_sub_domain" {}
variable "apache-confluence_sub_domain" {}
variable "jira-confluence_sub_domain" {}
variable "bastion_sub_domain" {}
variable "elb_sub_domain" {}
