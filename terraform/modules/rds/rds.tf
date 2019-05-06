resource "aws_db_instance" "arul_demo" {
  allocated_storage         = 20
  backup_retention_period   = 2
  db_subnet_group_name      = "${var.db_subnet_group_name}"
  final_snapshot_identifier = "arul-demo-final-snapshot"
  vpc_security_group_ids    = ["${var.vpc_security_group_ids}"]
  skip_final_snapshot       = true

  # ssd
  storage_type   = "gp2"
  engine         = "mysql"
  instance_class = "db.t2.micro"
  name           = "arul_demo"
  username       = "aruldemo"
  password       = "${var.db_password}"

  tags {
    Name    = "mysql db"
    env     = "demo"
    project = "arul-demo"
  }
}