resource "google_compute_network" "vpc_network" {
  name = var.VPC_name
  auto_create_subnetworks = false
  routing_mode = "REGIONAL"

}
resource "google_compute_subnetwork" "network-subnet" {
  name          = var.subnet_name
  ip_cidr_range = var.subnet_cidr
  private_ip_google_access = true
  
  region        = var.Region
  network       = google_compute_network.vpc_network.id
}

# for GKE pods and services
resource "google_compute_subnetwork" "cluster_subnetwork" {
  name          = "cluster-subnetwork"
  ip_cidr_range = "10.5.0.0/16"
  private_ip_google_access = true
  
  region        = var.Region
  network       = google_compute_network.vpc_network.id

  secondary_ip_range {
    range_name    = var.ip_range_pods_name
    ip_cidr_range = "10.6.0.0/24"
  }


  secondary_ip_range {
    range_name    = var.ip_range_services_name
    ip_cidr_range = "10.7.0.0/24"
  }
}
