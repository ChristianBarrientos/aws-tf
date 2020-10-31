#
# Creamos el droplet

resource "digitalocean_droplet" "mail2" {
  image     = "ubuntu-18-04-x64"
  name      = "mail2.capresca.gob.ar"
  region    = "nyc1"
  size      = "s-2vcpu-4gb"
  user_data = "${file("userdata.yaml")}"
  ssh_keys  = ["${digitalocean_ssh_key.capresca-ssh.fingerprint}"]
}