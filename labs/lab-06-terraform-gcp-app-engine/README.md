# Configuración de Ejemplo: GCP, App Engine
Este repositorio contiene una configuración de ejemplo para el siguiente caso de estudio en GCP utilizando Terraform. En esta configuración, Implementa una aplicación Node.js con Terraform en Google App Engine.

## Requisitos Previos
Antes de comenzar, asegúrate de tener lo siguiente:

1. Una cuenta de GCP.
2. [Terraform](https://www.terraform.io/downloads.html) instalado en tu máquina local.
3. Dado que el archivo principal de terraform se va a cargar en el repositorio de código con todo el proyecto, claramente no podemos almacenar ningún dato sensible. Así que pongamos la clave secreta y la clave de acceso en un archivo diferente, y coloquemos este archivo en nuestro gitignore.

Para separar los datos sensibles, crea un archivo en el mismo directorio llamado terraform.tfvars. Y decláralos así:

```terraform
# Application Definition 
app_name        = "lab-gcp-app-engine" # Do NOT enter any spaces
app_environment = "dev"                # Dev, Test, Staging, Prod, etc

# GCP Settings
gcp_location = "us-central"
gcp_region   = "us-central1"
gcp_zone     = "us-central1-c"
gcp_project  = "bootcamp-devops-engineer-63703"

# Bucket Settings
app_bucket_name = "bootcamp-devops-engineer-63703-app" 

```

## Output del terraform plan.
```bash
PS D:\workspace-git\Bootcamp-Devops-Engineer\labs\lab-06-terraform-gcp-app-engine> terraform plan -out=tfplan
data.archive_file.function_dist: Reading...
data.archive_file.function_dist: Read complete after 0s [id=412284eb047b6fe5727d0ac9c8e9e1aa92db382f]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # google_app_engine_application.node-app-engine will be created
  + resource "google_app_engine_application" "node-app-engine" {
      + app_id            = (known after apply)
      + auth_domain       = (known after apply)
      + code_bucket       = (known after apply)
      + database_type     = (known after apply)
      + default_bucket    = (known after apply)
      + default_hostname  = (known after apply)
      + gcr_domain        = (known after apply)
      + id                = (known after apply)
      + location_id       = "us-central"
      + name              = (known after apply)
      + project           = "bootcamp-devops-engineer-63703"
      + serving_status    = (known after apply)
      + url_dispatch_rule = (known after apply)
    }

  # google_app_engine_application_url_dispatch_rules.ts-appengine-app-dispatch-rules will be created
  + resource "google_app_engine_application_url_dispatch_rules" "ts-appengine-app-dispatch-rules" { 
      + id      = (known after apply)
      + project = (known after apply)

      + dispatch_rules {
          + domain  = "*"
          + path    = "/*"
          + service = "default"
        }
    }

  # google_app_engine_standard_app_version.node-app-engine-v1 will be created
  + resource "google_app_engine_standard_app_version" "node-app-engine-v1" {
      + delete_service_on_destroy = true
      + env_variables             = {
          + "port" = "8080"
        }
      + id                        = (known after apply)
      + instance_class            = "F1"
      + name                      = (known after apply)
      + noop_on_destroy           = true
      + project                   = "bootcamp-devops-engineer-63703"
      + runtime                   = "nodejs20"
      + service                   = "default"
      + service_account           = (known after apply)
      + version_id                = "v1"

      + automatic_scaling {
          + max_concurrent_requests = 10
          + max_idle_instances      = 3
          + max_pending_latency     = "5s"
          + min_idle_instances      = 1
          + min_pending_latency     = "1s"

          + standard_scheduler_settings {
              + max_instances                 = 10
              + min_instances                 = 2
              + target_cpu_utilization        = 0.5
              + target_throughput_utilization = 0.75
            }
        }

      + deployment {
          + zip {
              + source_url = "https://storage.googleapis.com/bootcamp-devops-engineer-63703-app/app.zip"
            }
        }

      + entrypoint {
          + shell = "node index.js"
        }
    }

  # google_storage_bucket.bucket will be created
  + resource "google_storage_bucket" "bucket" {
      + force_destroy               = true
      + id                          = (known after apply)
      + labels                      = (known after apply)
      + location                    = "US-CENTRAL1"
      + name                        = "bootcamp-devops-engineer-63703-app"
      + project                     = "bootcamp-devops-engineer-63703"
      + public_access_prevention    = (known after apply)
      + self_link                   = (known after apply)
      + storage_class               = "STANDARD"
      + uniform_bucket_level_access = (known after apply)
      + url                         = (known after apply)

      + versioning {
          + enabled = true
        }
    }

  # google_storage_bucket_object.object will be created
  + resource "google_storage_bucket_object" "object" {
      + bucket         = "bootcamp-devops-engineer-63703-app"
      + content_type   = (known after apply)
      + crc32c         = (known after apply)
      + detect_md5hash = "different hash"
      + id             = (known after apply)
      + kms_key_name   = (known after apply)
      + md5hash        = (known after apply)
      + media_link     = (known after apply)
      + name           = "app.zip"
      + output_name    = (known after apply)
      + self_link      = (known after apply)
      + source         = "../app/app.zip"
      + storage_class  = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.
```
