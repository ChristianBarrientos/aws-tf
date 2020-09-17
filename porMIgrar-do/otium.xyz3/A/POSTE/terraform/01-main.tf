resource "digitalocean_kubernetes_cluster" "otium-ssl" {
  name    = "otium-ssl"
  region  = "nyc3"
  version = "1.16.2-do.3"

  node_pool {
    name       = "otium-ssl-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 2
  }
}
