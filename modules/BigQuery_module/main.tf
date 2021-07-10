resource "google_bigquery_dataset" "dataset" {
  friendly_name               = var.Dataset_name
  dataset_id                  = var.Dataset_ID
}

