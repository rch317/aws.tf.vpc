#--------------------------------------------------------------
# This module creates all resources necessary for NAT
#--------------------------------------------------------------

variable "name" {
  default = "nat"
}

variable "azs" {}
variable "public_subnet_ids" {}

resource "aws_eip" "nat" {
  vpc = true

  #count = "${length(split(",", var.azs))}" # Comment out count to only have 1 NAT
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = "${element(aws_eip.nat.*.id, count.index)}"
  subnet_id     = "${element(split(",", var.public_subnet_ids), 1)}"

  ### Using the commented out code below will rebuild your NAT(s) on each
  ### apply you run. This may or may not be acceptable to you. Comment out
  ### the subnet_id code above, uncomment the below if that's ok. This will
  ### also provision multiple nat gateways. You will need to also uncomment
  ### the count in aws_eip above.

  #subnet_id     = "${element(split(",", var.public_subnet_ids), count.index)}"
  #count = "${length(split(",", var.azs))}" # Comment out count to only have 1 NAT

  lifecycle {
    create_before_destroy = true
  }
}

output "nat_gateway_ids" {
  value = "${join(",", aws_nat_gateway.nat.*.id)}"
}
