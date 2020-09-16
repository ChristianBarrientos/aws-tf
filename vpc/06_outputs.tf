output "vpc_id"{
  value = aws_vpc.chris-vpc.id
}

output "private_1_subnet_id" {
  value = aws_subnet.private_1.id
}

output "public_1_subnet_id" {
  value = aws_subnet.public_1.id
}

