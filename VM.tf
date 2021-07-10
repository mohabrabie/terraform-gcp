module "VM" {
  source = "./modules/VM_module"
    Machine_name = "test-vm"
    Machine_type = "n1-standard-1"
    OS_image = "debian-cloud/debian-9"
    Region = var.Region
    Zone  = var.Zone
    Project = var.Project
    subnet_id  = module.VPC.subnet_id
    account_email = module.vm-account.account_email
}