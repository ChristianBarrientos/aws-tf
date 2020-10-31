resource "digitalocean_kubernetes_cluster" "cluster-capresca" {
  name    = "cluster-kb"
  region  = "nyc3"
  version = "1.16.2-do.3"

  node_pool {
    name       = "capresca-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 1
    tags = ["capresca-nodes"]
  }
}
