# service accountes
module "vm-account" {
  source = "./modules/Service_Account_module"
   sa_name = "vm-account"
   sa_display_name = "vm-account"
}

module "gke-account" {
  source = "./modules/Service_Account_module"
   sa_name = "gke-account"
   sa_display_name = "gke-account"
}
# roles
module "gs-role" {
  source = "./modules/Role_module"
   account_email = module.vm-account.account_email
   role = "roles/storage.objectViewer"
   Project = var.Project
}

module "bq-role" {
  source = "./modules/Role_module"
   account_email = module.vm-account.account_email
   role = "roles/bigquery.admin"
   Project = var.Project
}

module "cr-role" {
  source = "./modules/Role_module"
   account_email = module.gke-account.account_email
   role = "roles/containerregistry.ServiceAgent"
   Project = var.Project
}