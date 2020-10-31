
#data "digitalocean_ssh_key" "otium-ssh" {
#  name = "otium-ssh"
#}

resource "digitalocean_ssh_key" "ot-ssh" {
  name       = "ot-ssh"
  public_key = "${file("gitlab.pub")}"
}

# Creamos el droplet
resource "digitalocean_droplet" "gitlab" {
  image     = "ubuntu-18-04-x64"
  name      = "gitlab-1"
  region    = "nyc1"
  size      = "s-2vcpu-4gb"
  user_data = "${file("userdata.yaml")}"
  ssh_keys  = ["${digitalocean_ssh_key.ot-ssh.fingerprint}"]  
}

#Traer el recurso 
data "digitalocean_domain" "otium" {
  name = "otium.xyz"
}

# Add a record to the domain
resource "digitalocean_record" "gitlab" {
  domain =  data.digitalocean_domain.otium.name    
  type   = "A"
  name   = "gitlab"
  value  = "${digitalocean_droplet.gitlab.ipv4_address}"
}



