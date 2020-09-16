variable "aws_access_key" {}
variable "aws_secret_key" {}

# Configure the AWS Provider
provider "aws" {
  region     = "eu-west-1"
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
}


