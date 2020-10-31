resource "digitalocean_kubernetes_cluster" "capresca-ssl" {
  name    = "capresca-ssl"
  region  = "nyc3"
  version = "1.16.2-do.3"

  node_pool {
    name       = "capresca-ssl-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 3
  }
}
