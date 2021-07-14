# vm
variable Region {
  type        = string
}
variable Zone {
  type        = string
}

# GS buckets
variable Storage_class {
  type        = string
}

variable Project {
  type        = string
}

#gke
variable ip_range_services_name{
  type        = string
}
variable ip_range_pods_name{
  type        = string
}