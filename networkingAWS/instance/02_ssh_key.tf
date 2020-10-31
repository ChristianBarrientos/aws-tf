resource "aws_key_pair" "chris_ssh" {
  key_name   = "chris_ssh"
  public_key = "${local.ssh_public_key}" #"local.ssh_public_key"
}


