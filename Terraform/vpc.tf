#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "CLASS" {
  cidr_block = "10.0.0.0/16"

  tags = "${
    map(
      "Name", "CLASS-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "CLASS" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.CLASS.id}"

  tags = "${
    map(
      "Name", "CLASS-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "CLASS" {
  vpc_id = "${aws_vpc.CLASS.id}"

  tags = {
    Name = "CLASS"
  }
}

resource "aws_route_table" "CLASS" {
  vpc_id = "${aws_vpc.CLASS.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.CLASS.id}"
  }
}

resource "aws_route_table_association" "CLASS" {
  count = 2

  subnet_id      = "${aws_subnet.CLASS.*.id[count.index]}"
  route_table_id = "${aws_route_table.CLASS.id}"
}
