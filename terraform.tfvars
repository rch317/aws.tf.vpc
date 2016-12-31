#--------------------------------------------------------------
# General
#--------------------------------------------------------------

region = "us-west-2"
cidr_block = "10.31.8.0/21"
enable_dns_support = true
enable_dns_hostnames = true

name = "dev"
environment = "dev"
team = "dev"

private_subnets = "10.31.8.0/24,10.31.9.0/24,10.31.10.0/24"
public_subnets = "10.31.11.0/24,10.31.12.0/24,10.31.13.0/24"
azs = "us-west-2a,us-west-2b,us-west-2c"

key_name = "devops.id_rsa"
bastion_instance_type = "t2.micro"
