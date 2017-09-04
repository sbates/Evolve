# Specify the provider and access details
# The region is specified in the variables.tf
provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_vpc" "evolve" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "evolve"
  }
}

resource "aws_subnet" "evolve_subnet" {
  vpc_id                  = "${aws_vpc.evolve.id}"
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "evolve_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.evolve.id}"

  tags {
    Name = "evolve_igw"
  }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.evolve.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags {
    Name = "evolve_aws_route_table"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.evolve_subnet.id}"
  route_table_id = "${aws_route_table.r.id}"
}

# The default security group to access
# the instances over SSH and HTTP
resource "aws_security_group" "evolve" {
  name        = "evolve_sg"
  description = "Evolve sg. Strangely like the other ones."
  vpc_id      = "${aws_vpc.evolve.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
