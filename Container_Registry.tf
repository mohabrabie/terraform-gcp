data "google_container_registry_repository" "container_registry" {
}

output "gcr_location" {
  value = data.google_container_registry_repository.container_registry.repository_url
}