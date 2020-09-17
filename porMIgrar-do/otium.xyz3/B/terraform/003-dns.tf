#data "digitalocean_domain" "otium" {
  #name = "otium.xyz"
#}
resource "digitalocean_domain" "otium" {
  name = "otium.xyz"
}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.otium.name}"
  type   = "A"
  name   = "www"
  ttl    = "60"
  value  = "45.55.127.227"
}


resource "digitalocean_record" "ticket" {
  domain = "${digitalocean_domain.otium.name}"
  type   = "A"
  name   = "ticket"
  ttl    = "30"
  value  = "45.55.127.227"
}

resource "digitalocean_record" "mail" {
  domain = "${digitalocean_domain.otium.name}"
  type   = "A"
  name   = "mail2"
  ttl    = "30"
  value  = "167.172.148.206"
}