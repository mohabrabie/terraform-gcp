
resource "google_container_cluster" "cluster" {
  name     = var.cluster_name
  location = var.cluster_region
  network = var.network
  subnetwork = var.subnetwork
  node_locations = var.cluster_zones_list

  cluster_ipv4_cidr = var.master_node_cidr
  remove_default_node_pool = true
  initial_node_count       = var.number_of_nodes_per_zone

  cluster_autoscaling {
    enabled = false
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