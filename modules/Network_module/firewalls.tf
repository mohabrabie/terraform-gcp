# resource "google_compute_firewall" "vpc-allow-ssh" {
#   name    = "vpc-allow-ssh"
#   network = google_compute_network.vpc_network.name
#   allow {
#     protocol = "tcp"
#     ports = ["22"]
#   }
# }
# resource "google_compute_firewall" "vpc-allow-icmp" {
#   name    = "vpc-allow-icmp"
#   network = google_compute_network.vpc_network.name
#   allow {
#     protocol = "icmp"
#   }
# }
resource "google_compute_firewall" "allow-ingress-from-iap" {
  name    = "allow-ingress-from-iap"
  network = google_compute_network.vpc_network.name
  direction = "INGRESS"
  source_ranges = ["35.235.240.0/20"]
  # "35.191.0.0/16","130.211.0.0/22"

  allow {
    protocol = "tcp"
    ports = ["22","3389"]
  }
}
