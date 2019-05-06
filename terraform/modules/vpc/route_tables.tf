resource "aws_route_table" "private_region_1_az_1" {
  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul-demo private ${var.region_1_az_1} subnet route table"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

resource "aws_route_table" "private_region_1_az_2" {
  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul-demo private ${var.region_1_az_2} subnet route table"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

resource "aws_route" "private_region_1_az_1" {
  route_table_id         = "${aws_route_table.private_region_1_az_1.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.arul_demo_private_region_1_az_1.id}"
}

resource "aws_route" "private_region_1_az_2" {
  route_table_id         = "${aws_route_table.private_region_1_az_2.id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = "${aws_nat_gateway.arul_demo_private_region_1_az_2.id}"
}

resource "aws_route_table" "arul_demo_public" {
  vpc_id = "${aws_vpc.arul_demo.id}"

  route {
    cidr_block = "${var.allow_all_cidr}"
    gateway_id = "${aws_internet_gateway.arul_demo.id}"
  }

  tags {
    Name    = "arul-demo public subnet route table"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

resource "aws_route_table_association" "arul_demo_public_subnet_region_1_az_1" {
  subnet_id      = "${aws_subnet.arul_demo_public_region_1_az_1.id}"
  route_table_id = "${aws_route_table.arul_demo_public.id}"
}

resource "aws_route_table_association" "arul_demo_private_subnet_region_1_az_1" {
  subnet_id      = "${aws_subnet.arul_demo_private_region_1_az_1.id}"
  route_table_id = "${aws_route_table.private_region_1_az_1.id}"
}

resource "aws_route_table_association" "arul_demo_private_subnet_region_1_az_2" {
  subnet_id      = "${aws_subnet.arul_demo_private_region_1_az_2.id}"
  route_table_id = "${aws_route_table.private_region_1_az_2.id}"
}
