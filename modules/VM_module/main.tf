resource "google_compute_instance" "vm_instance" {
  name         = var.Machine_name
  machine_type = var.Machine_type
  zone         = var.Zone
  allow_stopping_for_update = true


  network_interface{
    subnetwork   = var.subnet_id
  }
  boot_disk {
    initialize_params {
      image = var.OS_image
    }
  }
  service_account {
    email  = var.account_email
    scopes = ["cloud-platform"]
  }

}


