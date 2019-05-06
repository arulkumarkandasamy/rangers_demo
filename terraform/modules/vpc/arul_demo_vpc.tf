# VPCs are confusing. The hierarchy of ACL is:
# VPC -> Security group
#
# I believe the process of ingress is:
# public client -> VPC -> VPC route table -> igw -> instance
#
# And egress is:
# instance -> VPC route table -> igw or nat -> public address

# App VPC. Does not allow local access with CIDR block configuration.
# An AWS help desk recommended way to enable access to the bastion host from your local machine is to go to
# https://us-west-1.console.aws.amazon.com/vpc/home?region=us-west-1#vpcs and add a CIDR block containing your IP
# address to the VPC settings.
resource "aws_vpc" "arul_demo" {
  tags {
    Project = "${var.project_name}"
    Name    = "${var.project_name} VPC"
  }

  # https://serverfault.com/questions/630022/what-is-the-recommended-cidr-when-creating-vpc-on-aws
  # "...there is no harm in starting with a small prefix such as /16 because you can always create subnets."
  cidr_block = "${var.vpc_cidr}"

  # enabled by default, but just to be sure
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
}

resource "aws_db_subnet_group" "arul_demo_db_subnet" {
  name        = "arul_demo_db_subnet"
  description = "db subnet group"
  subnet_ids  = ["${aws_subnet.arul_demo_private_region_1_az_1.id}", "${aws_subnet.arul_demo_private_region_1_az_2.id}"]

  tags {
    Project = "${var.project_name}"
    Name    = "DB subnet group"
  }
}

# https://serverfault.com/questions/630022/what-is-the-recommended-cidr-when-creating-vpc-on-aws
# ...For smaller networks, use a 24-bit mask in different regions
# Private
resource "aws_subnet" "arul_demo_private_region_1_az_1" {
  availability_zone = "${var.region_1_az_1}"

  cidr_block = "${var.private_subnet_cidr}"
  vpc_id     = "${aws_vpc.arul_demo.id}"

  tags {
    Project = "arul-demo"
    Name    = "private ${var.region_1_az_1} subnet"
  }
}

resource "aws_subnet" "arul_demo_private_region_1_az_2" {
  availability_zone = "${var.region_1_az_2}"

  cidr_block = "${var.private_subnet_cidr_2}"
  vpc_id     = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "private ${var.region_1_az_2} subnet"
    Project = "arul-demo"
  }
}

# Public
resource "aws_subnet" "arul_demo_public_region_1_az_1" {
  availability_zone = "${var.region_1_az_1}"

  cidr_block = "${var.public_subnet_cidr}"
  vpc_id     = "${aws_vpc.arul_demo.id}"

  tags {
    Project = "arul-demo"
    Name    = "public ${var.region_1_az_1} subnet"
  }
}

resource "aws_subnet" "arul_demo_public_region_1_az_2" {
  availability_zone = "${var.region_1_az_2}"

  cidr_block = "${var.public_subnet_cidr_2}"
  vpc_id     = "${aws_vpc.arul_demo.id}"

  tags {
    Project = "arul-demo"
    Name    = "public ${var.region_1_az_2} subnet"
  }
}

