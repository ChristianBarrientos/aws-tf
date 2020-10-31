resource "digitalocean_kubernetes_cluster" "cluster-otium" {
  name    = "cluster-otium"
  region  = "nyc3"
  version = "1.16.2-do.3"

  node_pool {
    name       = "otium-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 1
    tags =["otium-nodes"]
  }
}
