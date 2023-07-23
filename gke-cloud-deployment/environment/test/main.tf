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

module "kubernetes-engine" {
  source  = "terraform-google-modules/kubernetes-engine/google"
  version = "27.0.0"
  project_id = var.gke_project_id 
  name = "x15"
  region = "asia-eat1"
}