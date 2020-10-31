# Creamos un dominio nuevo

resource "digitalocean_domain" "capresca" {
  name = "capresca.gob.ar"
}

# Add a record to the domain
resource "digitalocean_record" "www" {
  domain = "${digitalocean_domain.capresca.name}"
  type   = "A"
  name   = "www"
  ttl    = "60"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
