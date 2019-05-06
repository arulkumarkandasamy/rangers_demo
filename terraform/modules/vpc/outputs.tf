output "default_vpc_id" {
  value = "${aws_vpc.arul_demo.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.arul_demo.cidr_block}"
}

output "db_subnet_group_name" {
  value = "${aws_db_subnet_group.arul_demo_db_subnet.id}"
}

output "vpc_security_group_ids" {
  value = ["${aws_security_group.arul_demo_vpc_inbound.id}"]
}

output "lambda_security_group_ids" {
  value = ["${aws_security_group.arul_demo_lambda_vpc_security_group.id}"]
}

output "subnet_ids" {
  value = ["${aws_subnet.arul_demo_private_region_1_az_1.id}", "${aws_subnet.arul_demo_private_region_1_az_2.id}"]
}

