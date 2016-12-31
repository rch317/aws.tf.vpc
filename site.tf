### variables.tf defines our vars,  terraform.tfvars holds the values
### Most likely plan to prepend the variables.tf to this file when I
### have completed the bulk of the build out.

provider "aws" {
  region = "${var.region}"
}

### This module configures the vpc and the networking
module "network" {
  source                = "modules/network"
  region                = "${var.region}"
  cidr_block            = "${var.cidr_block}"
  enable_dns_support    = "${var.enable_dns_support}"
  enable_dns_hostnames  = "${var.enable_dns_hostnames}"
  name                  = "${var.name}"
  environment           = "${var.environment}"
  team                  = "${var.team}"
  private_subnets       = "${var.private_subnets}"
  public_subnets        = "${var.public_subnets}"
  key_name              = "${var.key_name}"
  azs                   = "${var.azs}"
  bastion_instance_type = "${var.bastion_instance_type}"
}

/* You have to pass the output up from each module for this to work */
output "vpc_id" {
  value = "${module.network.vpc_id}"
}

output "public_subnet_ids" {
  value = "${module.network.public_subnet_ids}"
}

output "private_subnet_ids" {
  value = "${module.network.private_subnet_ids}"
}

output "nat_gateway_ids" {
  value = "${module.network.nat_gateway_ids}"
}

output "user" {
  value = "ubuntu"
}

output "private_ip" {
  value = "${module.network.private_ip}"
}

output "public_ip" {
  value = "${module.network.public_ip}"
}
