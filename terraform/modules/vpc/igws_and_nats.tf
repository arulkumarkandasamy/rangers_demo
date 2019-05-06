# Internet gateway. An Internet gateway serves two purposes: to provide a target in your VPC route tables for
# Internet-routable traffic, and to perform network address translation (NAT) for instances that have been assigned
# public IPv4 addresses.
#
# In other words, an igw functions as a two-way NAT gateway.
resource "aws_internet_gateway" "arul_demo" {
  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul-demo internet-gateway"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

# NAT
resource "aws_nat_gateway" "arul_demo_private_region_1_az_1" {
  allocation_id = "${aws_eip.arul_demo_private_region_1_az_1.id}"
  subnet_id     = "${aws_subnet.arul_demo_public_region_1_az_1.id}"
  depends_on    = ["aws_internet_gateway.arul_demo"]

  tags {
    Name    = "private ${var.region_1_az_1} nat"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

resource "aws_nat_gateway" "arul_demo_private_region_1_az_2" {
  allocation_id = "${aws_eip.arul_demo_private_region_1_az_2.id}"
  subnet_id     = "${aws_subnet.arul_demo_public_region_1_az_1.id}"
  depends_on    = ["aws_internet_gateway.arul_demo"]

  tags {
    Name    = "private ${var.region_1_az_2} nat"
    ENV     = "prod"
    Project = "arul-demo"
  }
}

output "igw_id" {
  value = "${aws_internet_gateway.arul_demo.id}"
}
