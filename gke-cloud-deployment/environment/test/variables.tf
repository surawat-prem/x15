variable "project_id" {
    type = string
}

# VPC

variable "network_name" {
    default = "k8s-vpc"
}
variable "auto_create_subnetworks" {
    default = false
}
# variable "routing_mode" {
#     default = "GLOBAL"
# }
variable "shared_vpc_host" {
    default = false
}
variable "delete_default_internet_gateway_routes" {
    default = false
}
variable "mtu" {
    default = 0
}

## SUBNET
variable "subnets" {
    default = [
        {
            subnet_name = "subnet-k8s-main"
            subnet_ip = "10.10.0.0/21"
            subnet_region = "asia-southeast1"
        },
        {
            subnet_name = "subnet-k8s-pods"
            subnet_ip = "10.10.8.0/22"
            subnet_region = "asia-southeast1"
        },
        {
            subnet_name = "subnet-service"
            subnet_ip = "10.10.12.0/22"
            subnet_region = "asia-southeast1"
        }
    ]
}
## END SUBNET
# END VPC

# GKE
variable "gke_zones" {
    default = [
        "asia-east1-a",
        "asia-east1-b"
    ]
}
variable "gke_enable_http_load_balancing" {
  default = false
}
variable "gke_enable_network_policy" {
  default = false
}
variable "gke_enable_horizontal_pod_autoscaling" {
    default = true
}
variable "gke_enable_filestore_csi_driver" {
    default = false
}
## NODE POOL
### DEFAULT NODE POOL
variable "gke_default_node_pool_name" {
    default = "default_node"
}
variable "gke_default_node_pool_machine_type" {
    default = "n1-standard-2"
}
variable "gke_default_node_pool_node_locations" {
    default = "asia-east1-a"
}
variable "gke_default_node_pool_min_count" {
    default = 1
}
variable "gke_default_node_pool_max_count" {
    default = 1
}
variable "gke_default_node_pool_local_ssd_count" {
    default = 0
}
variable "gke_default_node_pool_spot" {
    default = false
}
variable "gke_default_node_pool_disk_size_gb" {
    default = 50
}
variable "gke_default_node_pool_disk_type" {
    default = "pd-standard"
}
variable "gke_default_node_pool_image_type" {
    default = "COS_CONTAINERD"
}
variable "gke_default_node_pool_enable_gcfs" {
    default = false
}
variable "gke_default_node_pool_enable_gvnic" {
    default = false
}
variable "gke_default_node_pool_auto_repair" {
    default = true
}
variable "gke_default_node_pool_auto_upgrade" {
    default = false
}
variable "gke_default_node_pool_preemptible" {
    default = false
}
variable "gke_default_node_pool_initial_node_count" {
    default = 1
}
### END DEFAULT NODE POOL

### ADDITIONAL NODE POOL
variable "gke_additional_node_pool_name" {
    default = "app_node"
}
variable "gke_additional_node_pool_machine_type" {
    default = "n1-standard-2"
}
variable "gke_additional_node_pool_node_locations" {
    default = "asia-east1-a,asia-east1-b"
}
variable "gke_additional_node_pool_min_count" {
    default = 1
}
variable "gke_additional_node_pool_max_count" {
    default = 3
}
variable "gke_additional_node_pool_local_ssd_count" {
    default = 0
}
variable "gke_additional_node_pool_spot" {
    default = false
}
variable "gke_additional_node_pool_disk_size_gb" {
    default = 100
}
variable "gke_additional_node_pool_disk_type" {
    default = "pd-standard"
}
variable "gke_additional_node_pool_image_type" {
    default = "COS_CONTAINERD"
}
variable "gke_additional_node_pool_enable_gcfs" {
    default = false
}
variable "gke_additional_node_pool_enable_gvnic" {
    default = false
}
variable "gke_additional_node_pool_auto_repair" {
    default = true
}
variable "gke_additional_node_pool_auto_upgrade" {
    default = false
}
variable "gke_additional_node_pool_preemptible" {
    default = false
}
variable "gke_additional_node_pool_initial_node_count" {
    default = 1
}
### END ADDITIONAL NODE POOL
## END NODE POOL
# END GKE
