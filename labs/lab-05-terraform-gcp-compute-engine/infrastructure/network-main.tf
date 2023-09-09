###########################
## Network Module - Main ##
###########################

resource "google_compute_network" "vpc_network" {
  name                    = "${lower(var.app_name)}-${var.app_environment}-vpc"
  auto_create_subnetworks = false
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnetwork" {
  name                    = "${lower(var.app_name)}-${var.app_environment}-subnet"
  ip_cidr_range = "10.0.1.0/24"
  region        = var.gcp_region
  network       = google_compute_network.vpc_network.id
}
