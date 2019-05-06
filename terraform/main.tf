provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region  = "${var.aws_region}"
}

module "vpc" {
  source = "./modules/vpc"
  project_name = "${var.project_name}"
  vpc_cidr = "${var.vpc_cidr}"
  enable_dns_support = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  private_subnet_cidr = "${var.private_subnet_cidr}"
  private_subnet_cidr_2 = "${var.private_subnet_cidr_2}"
  public_subnet_cidr = "${var.public_subnet_cidr}"
  public_subnet_cidr_2 = "${var.public_subnet_cidr_2}"
  ins_ami = "${var.ins_ami}"
  aws_key_name = "${var.aws_key_name}"

}

module "rds" {
  source = "./modules/rds"
  db_subnet_group_name = "${module.vpc.db_subnet_group_name}"
  vpc_security_group_ids = ["${module.vpc.vpc_security_group_ids}"]
  db_password = "${var.db_password}"
}

module "lambda" {
  source = "./modules/lambda"
  DB_PASSWORD = "${module.rds.DB_PASSWORD}"
  DB_HOST_ADDRESS = "${module.rds.DB_HOST_ADDRESS}"
  security_group_ids = "${module.vpc.lambda_security_group_ids}"
  subnet_ids = "${module.vpc.subnet_ids}"
  repo_dir = "${var.repo_dir}"
  aws_region = "${var.aws_region}"
}