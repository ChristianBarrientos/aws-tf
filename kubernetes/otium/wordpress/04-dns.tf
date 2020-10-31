data "digitalocean_domain" "otium" {
  name = "otium.xyz"
}

resource "digitalocean_record" "mern" {
  domain =  data.digitalocean_domain.otium.name    
  type   = "A"
  name   = "mern"
  value  = "${digitalocean_loadbalancer.public-otium.ip}"
}

resource "digitalocean_record" "api" {
  domain =  data.digitalocean_domain.otium.name    
  type   = "A"
  name   = "api"
  value  = "${digitalocean_loadbalancer.public-otium.ip}"
}