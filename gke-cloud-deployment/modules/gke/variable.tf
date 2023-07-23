# variable "gke_project_id" {
#     type = string
# }
variable "gke_name" {
    type = string
}
variable "gke_region" {
    type = string
}
variable "gke_zones" {
    type = string
}
variable "gke_network" {
    type = string
}
variable "gke_subnetwork" {
    type = string
}
variable "gke_ip_range_pods" {
    type = string
}
variable "gke_ip_range_services" {
    type = string
}
variable "gke_http_load_balancing" {
    type = bool
}
variable "gke_network_policy" {
    type = bool
}
variable "gke_horizontal_pod_autoscaling" {
    type = bool
}
variable "gke_filestore_csi_driver" {
    type = bool
}

variable "gke_node_pools" {
    type = list(object({
        gke_node_pool_name = string
        gke_node_pool_machine_type = string
        gke_node_pool_node_locations = string
        gke_node_pool_min_count = number
        gke_node_pool_max_count = number
        gke_node_pool_local_ssd_count = number
        gke_node_pool_spot = bool
        gke_node_pool_disk_size_gb = string
        gke_node_pool_disk_type = string
        gke_node_pool_image_type = string
        gke_node_pool_enable_gcfs = bool
        gke_node_pool_enable_gvnic = bool
        gke_node_pool_auto_repair = bool
        gke_node_pool_auto_upgrade = bool
        gke_node_pool_service_account = string
        gke_node_pool_preemptible = bool
        gke_node_pool_initial_node_count = number
    }))
}