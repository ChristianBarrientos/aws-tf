data "digitalocean_kubernetes_versions" "otium" {
  version_prefix = "1.16."
}

resource "digitalocean_kubernetes_cluster" "ot-ssl" {
  name    = "ot-ssl"
  region  = "nyc3"
  version = data.digitalocean_kubernetes_versions.otium.latest_version


  node_pool {
    name       = "ot-ssl-nodes"
    size       = "s-2vcpu-2gb"
    node_count = 2
    tags    = ["ot-ssl-nodes"]
 #   auto_scale = true
 #   min_nodes  = 1
 #   max_nodes  = 5
  }

}

#resource "digitalocean_kubernetes_node_pool" "autoscale-pool-01" {
  #cluster_id = digitalocean_kubernetes_cluster.ot-ssl.id
  #name       = "autoscale-pool-01"
  #size       = "s-1vcpu-2gb"
  #auto_scale = true
  #min_nodes = 1
  #max_nodes = 3
#}