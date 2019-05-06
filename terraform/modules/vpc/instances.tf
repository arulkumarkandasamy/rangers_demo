resource "aws_instance" "arul_demo_bastion" {
  # Amazon Linux AMI 2017.09.1 (HVM), SSD Volume Type
  ami                    = "${var.ins_ami}"
  key_name               = "${var.aws_key_name}"
  instance_type          = "t2.micro"
  subnet_id              = "${aws_subnet.arul_demo_public_region_1_az_1.id}"
  vpc_security_group_ids = ["${aws_security_group.arul_demo_bastion_security_group.id}"]

  tags {
    Name    = "arul_demo bastion"
    Env     = "prod"
    Project = "arul_demo"
  }
}







