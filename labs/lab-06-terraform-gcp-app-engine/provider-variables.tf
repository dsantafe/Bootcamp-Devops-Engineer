#####################################
## GCP Provider Module - Variables ##
#####################################

# GCP connection & authentication

variable "gcp_location" {
  type        = string
  description = "GCP location"
}

variable "gcp_region" {
  type        = string
  description = "GCP region"
}

variable "gcp_zone" {
  type        = string
  description = "GCP zone"
}

variable "gcp_project" {
  type        = string
  description = "GCP project"
}
