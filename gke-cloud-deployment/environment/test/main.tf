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

# module "kubernetes-engine" {
#   source  = "terraform-google-modules/kubernetes-engine/google"
#   version = "27.0.0"
#   project_id = var.gke_project_id 
#   name = "x15"
#   region = "asia-eat1"
# }