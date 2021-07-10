module "BigQuery-1" {
  source = "./modules/BigQuery_module"
    Dataset_name  = "dataset 1"
    Dataset_ID    = "1"
}
module "BigQuery-2" {
  source = "./modules/BigQuery_module"
    Dataset_name  = "dataset 2"
    Dataset_ID    = "2"
}
module "BigQuery-3" {
  source = "./modules/BigQuery_module"
    Dataset_name  = "dataset 3"
    Dataset_ID    = "3"
}