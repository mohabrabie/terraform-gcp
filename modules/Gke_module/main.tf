
resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.cluster_region
  network = var.network
  subnetwork = var.subnetwork
  node_locations = var.cluster_zones_list
  default_max_pods_per_node = 20
  # cluster_ipv4_cidr = var.master_node_cidr
  remove_default_node_pool = true
  initial_node_count       = var.number_of_nodes_per_zone

  cluster_autoscaling {
    enabled = false
    }
    
  private_cluster_config{
    enable_private_nodes = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = "10.2.20.0/28"
  }
  master_authorized_networks_config{
    cidr_blocks {
      cidr_block = "10.0.0.0/24"
      # "35.235.240.0/20"
      display_name = "authorized_network"
    }
  }
  ip_allocation_policy {
    cluster_secondary_range_name  = var.ip_range_pods_name
    services_secondary_range_name = var.ip_range_services_name
  }
  #   addons_config {
  #   network_policy_config {
  #     disabled = false
  #   }
  # }
  network_policy {
    enabled = true
  }

}

resource "google_container_node_pool" "node-pool" {
  name       = "my-node-pool"
  location   = var.cluster_region
  cluster    = google_container_cluster.cluster.name
  node_count = 2

  node_config {
    preemptible  = true
    machine_type = var.machine_type
    disk_type         = "pd-standard"
    disk_size_gb      = "100"

    service_account = var.account_email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}