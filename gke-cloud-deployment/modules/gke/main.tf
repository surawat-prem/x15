module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google"
  project_id                 = var.gke_project_id
  name                       = var.gke_name
  region                     = var.gke_region
  zones                      = var.gke_zones
  network                    = var.gke_network
  subnetwork                 = var.gke_subnetwork
  ip_range_pods              = var.gke_ip_range_pods
  ip_range_services          = var.gke_ip_range_services
  http_load_balancing        = var.gke_http_load_balancing
  network_policy             = var.gke_network_policy
  horizontal_pod_autoscaling = var.gke_horizontal_pod_autoscaling
  filestore_csi_driver       = var.gke_filestore_csi_driver

  node_pools = [
    {
      name                      = var.gke_node_pools.gke_node_pool_name
      machine_type              = var.gke_node_pools.gke_node_pool_machine_type
      node_locations            = var.gke_node_pools.gke_node_pool_node_locations
      min_count                 = var.gke_node_pools.gke_node_pool_min_count
      max_count                 = var.gke_node_pools.gke_node_pool_max_count
      local_ssd_count           = var.gke_node_pools.gke_node_pool_local_ssd_count
      spot                      = var.gke_node_pools.gke_node_pool_spot
      disk_size_gb              = var.gke_node_pools.gke_node_pool_disk_size_gb
      disk_type                 = var.gke_node_pools.gke_node_pool_disk_type
      image_type                = var.gke_node_pools.gke_node_pool_image_type
      enable_gcfs               = var.gke_node_pools.gke_node_pool_enable_gcfs
      enable_gvnic              = var.gke_node_pools.gke_node_pool_enable_gvnic
      auto_repair               = var.gke_node_pools.gke_node_pool_auto_repair
      auto_upgrade              = var.gke_node_pools.gke_node_pool_auto_upgrade
      service_account           = var.gke_node_pools.gke_node_pool_service_account
      preemptible               = var.gke_node_pools.gke_node_pool_preemptible
      initial_node_count        = var.gke_node_pools.gke_node_pool_initial_node_count
    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }

  node_pools_taints = {
    all = []

    default-node-pool = [
      {
        key    = "default-node-pool"
        value  = true
        effect = "PREFER_NO_SCHEDULE"
      },
    ]
  }

  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}