#--------------------------------------------------------------
# This module creates all resources necessary for a VPC
#--------------------------------------------------------------

variable "cidr_block" { }
variable "enable_dns_support" { }
variable "enable_dns_hostnames" { }
variable "name" { }
variable "environment" { }
variable "team" { }

resource "aws_vpc" "vpc" {
  cidr_block           = "${var.cidr_block}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"

  lifecycle {
    create_before_destroy = true
  }

  tags {
    Name        = "${var.name}"
    environment = "${var.environment}"
    team        = "${var.team}"
  }
}

output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "vpc_cidr" {
  value = "${aws_vpc.vpc.cidr_block}"
}
