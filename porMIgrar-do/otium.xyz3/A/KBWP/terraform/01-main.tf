resource "digitalocean_kubernetes_cluster" "ot-ssl" {
  name    = "ot-ssl"
  region  = "nyc3"
  version = "1.16.6-do.0"

  node_pool {
    name       = "ot-ssl-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}
