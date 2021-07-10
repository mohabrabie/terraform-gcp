module "gsbucket-1" {
  source = "./modules/CloudStorsge_module"
    bucket_name   = "gsbucket-100"
    Storage_class = var.Storage_class
}
module "gsbucket-2" {
  source = "./modules/CloudStorsge_module"
    bucket_name  = "gsbucket-200"
    Storage_class = var.Storage_class
}
module "gsbucket-3" {
  source = "./modules/CloudStorsge_module"
    bucket_name  = "gsbucket-300"
    Storage_class = var.Storage_class
}