module "VPC" {
  source = "./modules/Network_module"
   VPC_name    = "main-vpc"
   VPC_cidr    = "10.0.0.0/16"
   subnet_name = "subnet-1"
   subnet_cidr = "10.0.0.0/24"
   Region      = var.Region
   ip_range_pods_name = var.ip_range_pods_name
   ip_range_services_name = var.ip_range_services_name
}