data "digitalocean_kubernetes_versions" "otium" {
  version_prefix = "1.16."
}

resource "digitalocean_kubernetes_cluster" "cicd" {
  name    = "cicd"
  region  = "nyc1"
  version = data.digitalocean_kubernetes_versions.otium.latest_version

  node_pool {
    name       = "cicd-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 1
  }
}
