variable "region" {}
variable "cidr_block" {}

variable "enable_dns_support" {
  default = true
}

variable "enable_dns_hostnames" {
  default = true
}

variable "name" {}
variable "environment" {}
variable "team" {}
variable "azs" {}
variable "private_subnets" {}
variable "public_subnets" {}
