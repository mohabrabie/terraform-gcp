output "subnet_id" {
  value       = google_compute_subnetwork.network-subnet.id
}
output "cluster_subnet_id" {
  value       = google_compute_subnetwork.cluster_subnetwork.id
}
output "network_name" {
  value       = google_compute_network.vpc_network.name
}
