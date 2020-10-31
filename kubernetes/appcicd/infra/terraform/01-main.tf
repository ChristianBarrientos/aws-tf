data "digitalocean_kubernetes_versions" "ot-mern" {
  version_prefix = "1.16."
}

resource "digitalocean_kubernetes_cluster" "ot-mern-ssl" {
  name    = "ot-ssl"
  region  = "nyc3"
  version = data.digitalocean_kubernetes_versions.ot-mern.latest_version


  node_pool {
    name       = "ot-mern-ssl-nodes"
    size       = "s-2vcpu-2gb"
    node_count = 1
    tags    = ["ot-mern-ssl-nodes"]

  }

}
