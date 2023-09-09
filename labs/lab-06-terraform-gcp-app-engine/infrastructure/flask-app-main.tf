##############################
## App Engine Module - Main ##
##############################

resource "google_app_engine_application" "flask-app-engine" {
  project = var.gcp_project
}

resource "google_app_engine_standard_app_version" "flask-app-engine-version" {
  version_id = "v1"
  service    = "default"
  runtime    = "python39"
  entrypoint = "python app.py" # Comando de entrada para tu aplicación Flask

  deployment {
    zip {
      source_url = "https://github.com/dsantafe/Bootcamp-Devops-Engineer/tree/main/labs/lab-06-terraform-gcp-app-engine/api.zip" # URL de tu repositorio de GitHub
    }
  }
}
