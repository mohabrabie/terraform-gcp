variable account_email {
  type        = string
}
variable cluster_region {
  type        = string
}
variable cluster_zones_list {
type          = list(string)
}
variable machine_type {
  type        = string
}
variable number_of_nodes_per_zone {
  type        = string
}
variable cluster_name {
  type        = string
}
variable master_node_cidr {
  type        = string
}
variable gcr_location {
  type        = string
}
variable network{
  type        = string
}
variable subnetwork{
  type        = string
}
variable ip_range_services_name{
  type        = string
}
variable ip_range_pods_name{
  type        = string
}