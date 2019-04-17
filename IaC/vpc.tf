#
# VPC Resources
#  * VPC
#  * Subnets
#  * Internet Gateway
#  * Route Table
#

resource "aws_vpc" "kompass" {
  cidr_block = "10.0.0.0/16"

  tags = "${
    map(
      "Name", "kompass-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_subnet" "kompass" {
  count = 2

  availability_zone = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block        = "10.0.${count.index}.0/24"
  vpc_id            = "${aws_vpc.kompass.id}"

  tags = "${
    map(
      "Name", "kompass-node",
      "kubernetes.io/cluster/${var.cluster-name}", "shared",
    )
  }"
}

resource "aws_internet_gateway" "kompass" {
  vpc_id = "${aws_vpc.kompass.id}"

  tags = {
    Name = "kompass"
  }
}

resource "aws_route_table" "kompass" {
  vpc_id = "${aws_vpc.kompass.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.kompass.id}"
  }
}

resource "aws_route_table_association" "kompass" {
  count = 2

  subnet_id      = "${aws_subnet.kompass.*.id[count.index]}"
  route_table_id = "${aws_route_table.kompass.id}"
}
