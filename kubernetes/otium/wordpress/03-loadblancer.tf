resource "digitalocean_loadbalancer" "public-otium" {
  name = "loadbalancer-1"
  region = "nyc3"

  forwarding_rule {
    entry_port = 80
    entry_protocol = "http"

    target_port = 80
    target_protocol = "http"
  }

  healthcheck {
    port = 80
    protocol = "tcp"
  }

  droplet_tag = "otium-nodes"
}

