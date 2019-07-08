# Define our VPC
resource "aws_vpc" "default" {
  cidr_block = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "FizzBuzz-vpc"
  }
}
# Define the public subnet
resource "aws_subnet" "fizzbuzz-public-subnet" {
  vpc_id = "${aws_vpc.default.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"

  tags {
    Name = "FizzBuzz Public Subnet"
  }
}
# Define the internet gateway
resource "aws_internet_gateway" "fizzbuzz-gw" {
  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "FizzBuzz VPC IGW"
  }
}
# Define the route table
resource "aws_route_table" "fizzbuzz-public-rt" {
  vpc_id = "${aws_vpc.default.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.fizzbuzz-gw.id}"
  }

  tags {
    Name = "Public Subnet RT"
  }
}

# Assign the route table to the public Subnet
resource "aws_route_table_association" "fizzbuzz-public-rt" {
  subnet_id = "${aws_subnet.fizzbuzz-public-subnet.id}"
  route_table_id = "${aws_route_table.fizzbuzz-public-rt.id}"
}
# Define the security group for public subnet
resource "aws_security_group" "fizzbuzz-sg" {
  name = "FizzBuzz-SG"
  description = "All access"
  

    ingress {
    from_port = 22
    to_port = 65535
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
    egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  vpc_id="${aws_vpc.default.id}"

  tags {
    Name = "FizzBuzz SG"
  }
}
# Define SSH key pair for our instances
resource "aws_key_pair" "default" {
  #key_name = "horizonvpctestkeypair"
  public_key = "${file("${var.key_path}")}"
}
# Define FizzBUzz server inside the public subnet
resource "aws_instance" "fizzbuzz-inst" {
   ami  = "${var.ami}"
   instance_type = "t2.micro"
   key_name = "${aws_key_pair.default.id}"
   subnet_id = "${aws_subnet.fizzbuzz-public-subnet.id}"
   vpc_security_group_ids = ["${aws_security_group.fizzbuzz-sg.id}"]
   associate_public_ip_address = true
   source_dest_check = false
   user_data = "${file("user_data.sh")}"
  tags {
    Name = "fizzbuzzserver"
  }
}
