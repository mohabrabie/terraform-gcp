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