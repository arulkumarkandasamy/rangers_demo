output "rds_host_address" {
  value = "${aws_db_instance.arul_demo.address}"
}

output "rds_instance_id" {
  value = "${aws_db_instance.arul_demo.id}"
}

output "DB_PASSWORD" {
  value = "${aws_db_instance.arul_demo.password}"
}

output "DB_HOST_ADDRESS" {
  value = "${aws_db_instance.arul_demo.address}"
}