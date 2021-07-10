module "gke" {
  source = "./modules/Gke_module"
  account_email = module.gke-account.account_email
  cluster_region = var.Region
  cluster_zones_list = ["us-central1-c", "us-central1-f"]
  machine_type = "e2-standard-2"
  number_of_nodes_per_zone = "1"
  cluster_name = "gke-cluster"
  master_node_cidr = "10.1.0.0/16"
  gcr_location = data.google_container_registry_repository.container_registry.repository_url
  network = module.VPC.network_name
  subnetwork = module.VPC.subnet_id
}