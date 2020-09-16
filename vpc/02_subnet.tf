resource "aws_subnet" "public_1" {
  vpc_id = aws_vpc.chris-vpc.id
  cidr_block = "10.0.10.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"
  tags = {
    Name = "${local.project_name}-public1"
  }
}

resource "aws_subnet" "private_1" {
  vpc_id = aws_vpc.chris-vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "eu-west-1a"

  tags = {
    Name = "${local.project_name}-private1"
  }
}
