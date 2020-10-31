
#
# Exportamos nuestra key SSH

resource "digitalocean_ssh_key" "capresca-ssh" {
  name       = "capresca-ssh"
  public_key = "${file("id_rsa.pub")}"
}