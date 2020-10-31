resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.chris-vpc.id

  tags = {
    Name = local.project_name
  }
}
