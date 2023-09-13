################################
## GCP Provider Module - Main ##
################################

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.10.0"
    }
  }
}

provider "google" {
  credentials = file("service-account.json")
  project     = var.gcp_project
  region      = var.gcp_region
  zone        = var.gcp_zone
}
