resource "google_storage_bucket" "bucket" {
  name                  = var.bucket_name
  storage_class         = var.Storage_class
  location              = "US"
  force_destroy         = true
}