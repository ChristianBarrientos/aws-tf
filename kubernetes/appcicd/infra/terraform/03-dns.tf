data "digitalocean_domain" "otium" {
  name = "otium.xyz"
}

resource "digitalocean_record" "mern" {
  domain =  data.digitalocean_domain.otium.name    
  type   = "A"
  name   = "mern"
  value  = "170.210.1.2"
}

resource "digitalocean_record" "api" {
  domain =  data.digitalocean_domain.otium.name    
  type   = "A"
  name   = "api"
  value  = "170.210.1.2"
}
