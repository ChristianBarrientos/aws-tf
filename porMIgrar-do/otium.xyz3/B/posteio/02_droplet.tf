#
# Creamos el droplet

resource "digitalocean_droplet" "webmail" {
  image     = "ubuntu-18-04-x64"
  name      = "webmail.otium.xyz"
  region    = "nyc1"
  size      = "s-2vcpu-2gb"
  user_data = "${file("userdata.yaml")}"
  ssh_keys  = ["${digitalocean_ssh_key.otium-ssh.fingerprint}"]
}