#--------------------------------------------------------------
# This module creates all networking resources
#--------------------------------------------------------------

variable "cidr_block" {}
variable "enable_dns_support" {}
variable "enable_dns_hostnames" {}
variable "name" {}
variable "environment" {}
variable "region" {}
variable "team" {}
variable "azs" {}
variable "private_subnets" {}
variable "public_subnets" {}
variable "key_name" {}
variable "bastion_instance_type" {}

module "vpc" {
  source               = "vpc"
  cidr_block           = "${var.cidr_block}"
  enable_dns_support   = "${var.enable_dns_support}"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  name                 = "${var.name}-vpc"
  environment          = "${var.environment}"
  team                 = "${var.team}"
}

module "public_subnet" {
  source = "public_subnet"
  name   = "${var.name}-public"
  vpc_id = "${module.vpc.vpc_id}"
  cidrs  = "${var.public_subnets}"
  azs    = "${var.azs}"
}

module "nat" {
  source            = "nat"
  name              = "${var.name}-nat"
  azs               = "${var.azs}"
  public_subnet_ids = "${module.public_subnet.subnet_ids}"
}

module "private_subnet" {
  source = "private_subnet"

  name   = "${var.name}-private"
  vpc_id = "${module.vpc.vpc_id}"
  cidrs  = "${var.private_subnets}"
  azs    = "${var.azs}"

  nat_gateway_ids = "${module.nat.nat_gateway_ids}"
}

module "bastion" {
  source = "bastion"

  name              = "${var.name}-bastion"
  vpc_id            = "${module.vpc.vpc_id}"
  vpc_cidr          = "${module.vpc.vpc_cidr}"
  region            = "${var.region}"
  public_subnet_ids = "${module.public_subnet.subnet_ids}"
  key_name          = "${var.key_name}"
  instance_type     = "${var.bastion_instance_type}"
}

output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "public_subnet_ids" {
  value = "${module.public_subnet.subnet_ids}"
}

output "private_subnet_ids" {
  value = "${module.private_subnet.subnet_ids}"
}

output "nat_gateway_ids" {
  value = "${module.nat.nat_gateway_ids}"
}

output "user" {
  value = "ubuntu"
}

output "private_ip" {
  value = "${module.bastion.private_ip}"
}

output "public_ip" {
  value = "${module.bastion.public_ip}"
}
