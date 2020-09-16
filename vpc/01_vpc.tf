resource "aws_vpc" "chris-vpc" {

  cidr_block = local.vpc_cidr
  enable_dns_hostnames = "true"
  tags = {
    Name = local.project_name
  }

}

