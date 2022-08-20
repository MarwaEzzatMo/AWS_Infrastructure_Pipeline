resource "aws_vpc" "terra_vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.name}-terra_vpc"
  }
  enable_dns_support   = true
  enable_dns_hostnames = true
}