##############################
## App Engine Module - Main ##
##############################

resource "google_app_engine_application" "node-app-engine" {
  project     = var.gcp_project
  location_id = var.gcp_location
}

resource "google_app_engine_application_url_dispatch_rules" "ts-appengine-app-dispatch-rules" {
  dispatch_rules {
    domain  = "*"
    path    = "/*"
    service = "default"
  }
}

resource "google_app_engine_standard_app_version" "node-app-engine-v1" {
  version_id = "v1"
  project    = var.gcp_project
  service    = "default"
  runtime    = "nodejs20"

  entrypoint {
    shell = "node index.js"
  }

  deployment {
    zip {
      source_url = "https://storage.googleapis.com/${google_storage_bucket.bucket.name}/${google_storage_bucket_object.object.name}"
    }
  }

  instance_class = "F1"

  env_variables = {
    port = "8080"
  }

  automatic_scaling {
    max_concurrent_requests = 10
    min_idle_instances      = 1
    max_idle_instances      = 3
    min_pending_latency     = "1s"
    max_pending_latency     = "5s"
    standard_scheduler_settings {
      target_cpu_utilization        = 0.5
      target_throughput_utilization = 0.75
      min_instances                 = 2
      max_instances                 = 10
    }
  }

  delete_service_on_destroy = true
  noop_on_destroy           = true
}

data "archive_file" "function_dist" {
  type        = "zip"
  source_dir  = "../app"
  output_path = "../app/app.zip"
}

resource "google_storage_bucket" "bucket" {
  project       = var.gcp_project
  name          = var.app_bucket_name
  location      = var.gcp_region
  force_destroy = true

  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_object" "object" {
  name   = "app.zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.function_dist.output_path
}
