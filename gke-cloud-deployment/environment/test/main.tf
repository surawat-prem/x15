terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.74.0"
    }
  }
}

provider "google" {
  # Configuration options
}

module "network" {
  source  = "terraform-google-modules/network/google"
  version = "7.1.0"

  ## VPC
  network_name  = var.network_name
  auto_create_subnetworks = var.auto_create_subnetworks
  # routing_mode  = var.routing_mode
  project_id  = var.project_id
  shared_vpc_host = var.shared_vpc_host
  delete_default_internet_gateway_routes  = var.delete_default_internet_gateway_routes
  mtu = var.mtu

  ## SUBNET
  subnets = var.subnets
  # secondary_ranges  = var.secondary_ranges
}

module "kubernetes-engine" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "27.0.0"
  project_id = var.project_id 
  name = "x15"
  region = "asia-eats1"
  zones                      = var.gke_zones
  network                    = var.network_name
  subnetwork                 = var.subnets[0].subnet_name
  ip_range_pods              = var.subnets[1].subnet_name
  ip_range_services          = var.subnets[2].subnet_name
  http_load_balancing        = var.gke_enable_http_load_balancing
  network_policy             = var.gke_enable_network_policy
  horizontal_pod_autoscaling = var.gke_enable_horizontal_pod_autoscaling
  filestore_csi_driver       = var.gke_enable_filestore_csi_driver

  node_pools = [
    {
      name                      = var.gke_default_node_pool_name
      machine_type              = var.gke_default_node_pool_machine_type
      node_locations            = var.gke_default_node_pool_node_locations
      min_count                 = var.gke_default_node_pool_min_count
      max_count                 = var.gke_default_node_pool_max_count
      local_ssd_count           = var.gke_default_node_pool_local_ssd_count
      spot                      = var.gke_default_node_pool_spot
      disk_size_gb              = var.gke_default_node_pool_disk_size_gb
      disk_type                 = var.gke_default_node_pool_disk_type
      image_type                = var.gke_default_node_pool_image_type
      enable_gcfs               = var.gke_default_node_pool_enable_gcfs
      enable_gvnic              = var.gke_default_node_pool_enable_gvnic
      auto_repair               = var.gke_default_node_pool_auto_repair
      auto_upgrade              = var.gke_default_node_pool_auto_upgrade
      service_account           = var.service_account
      preemptible               = var.gke_default_node_pool_preemptible
      initial_node_count        = var.gke_default_node_pool_initial_node_count
    },
    {
      name                      = var.gke_additional_node_pool_name
      machine_type              = var.gke_additional_node_pool_machine_type
      node_locations            = var.gke_additional_node_pool_node_locations
      min_count                 = var.gke_additional_node_pool_min_count
      max_count                 = var.gke_additional_node_pool_max_count
      local_ssd_count           = var.gke_additional_node_pool_local_ssd_count
      spot                      = var.gke_additional_node_pool_spot
      disk_size_gb              = var.gke_additional_node_pool_disk_size_gb
      disk_type                 = var.gke_additional_node_pool_disk_type
      image_type                = var.gke_additional_node_pool_image_type
      enable_gcfs               = var.gke_additional_node_pool_enable_gcfs
      enable_gvnic              = var.gke_additional_node_pool_enable_gvnic
      auto_repair               = var.gke_additional_node_pool_auto_repair
      auto_upgrade              = var.gke_additional_node_pool_auto_upgrade
      service_account           = var.service_account
      preemptible               = var.gke_additional_node_pool_preemptible
      initial_node_count        = var.gke_additional_node_pool_initial_node_count
    },
  ]

  # node_pools_oauth_scopes = {
  #   all = [
  #     "https://www.googleapis.com/auth/logging.write",
  #     "https://www.googleapis.com/auth/monitoring",
  #   ]
  # }

  # node_pools_labels = {
  #   all = {}

  #   default-node-pool = {
  #     default-node-pool = true
  #   }
  # }
}