resource "google_compute_firewall" "vpc-allow-ssh" {
  name    = "vpc-allow-ssh"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "tcp"
    ports = ["22"]
  }
}
resource "google_compute_firewall" "vpc-allow-icmp" {
  name    = "vpc-allow-icmp"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
}
resource "google_compute_firewall" "vpc-allow-internet" {
  name    = "vpc-allow-internet"
  network = google_compute_network.vpc_network.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports = ["0-65535"]
  }
}