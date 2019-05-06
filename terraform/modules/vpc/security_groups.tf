# Assign this to instances that are bastion hosts and that will have access to the VPC via the "arul_demo_vpc_inbound"
# security group.
resource "aws_security_group" "arul_demo_bastion_security_group" {
  name = "arul-demo-bastion-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul_demo_bastion_security_group"
    Env     = "demo"
    Project = "arul-demo"
  }
}

# "protocol = -1" means "all protocols"
# Assign this security group to any lambda, and any instance that the lambdas need to talk to
resource "aws_security_group" "arul_demo_lambda_vpc_security_group" {
  name = "arul-demo-lambda-vpc-security-group"

  egress {
    from_port = 0
    to_port   = 0

    // all protocols
    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul-demo-lambda-vpc-security-group"
    Env     = "prod"
    Project = "arul-demo"
  }
}

# Inbound connections allowed to the VPC
resource "aws_security_group" "arul_demo_vpc_inbound" {
  name = "vpc_inbound"

  # Only postgres in so that developers can ssh to the RDS instance via the bastion host
  # https://stackoverflow.com/questions/15100368/postgresql-port-confusion-5433-or-5432
  ingress {
    from_port = 5432
    to_port   = 5432
    protocol  = "tcp"

    security_groups = ["${aws_security_group.arul_demo_lambda_vpc_security_group.id}",
      "${aws_security_group.arul_demo_bastion_security_group.id}",
    ]
  }

  # "Egress" means "initiation". Once the connection is established, the security groups don't apply.
  # No egress rule is needed for the database to respond.
  # This allows instances of this security group to connect to any IP in the VPC. Not the lambdas, because the lambda
  # security rule is not referenced here.
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  vpc_id = "${aws_vpc.arul_demo.id}"

  tags {
    Name    = "arul_demo_vpc_inbound"
    Env     = "demo"
    Project = "arul-demo"
  }
}
