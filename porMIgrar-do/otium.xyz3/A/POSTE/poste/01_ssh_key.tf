
#
# Exportamos nuestra key SSH

resource "digitalocean_ssh_key" "otium-ssh" {
  name       = "otium-ssh"
  public_key = "${file("id_rsa.pub")}"
}