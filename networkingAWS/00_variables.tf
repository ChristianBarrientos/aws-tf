locals {
    project_name = "vpc-tr"
    #ssh_public_key = file("${path.module}/awsInstancia.pub")
    instance_ami_debian = "ami-007cca75305afe2f0"
    instance_type = "t2.micro"
    vpc_cidr = "10.0.0.0/16"
}