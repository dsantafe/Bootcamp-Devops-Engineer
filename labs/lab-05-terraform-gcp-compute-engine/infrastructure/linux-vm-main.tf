###################################
## Virtual Machine Module - Main ##
###################################

resource "google_compute_instance" "linux-server" {
  name         = "${lower(var.app_name)}-${var.app_environment}-linux-server"
  machine_type = var.linux_machine_type
  zone         = var.gcp_zone
  tags         = ["ssh", "${lower(var.app_name)}-${var.app_environment}-linux-server", var.app_environment]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11" # En esta sección, crearás una sola instancia de Compute Engine que ejecuta Debian.
    }
  }

  # Install Flask
  metadata_startup_script = "sudo apt-get update; sudo apt-get install -yq build-essential python3-pip rsync; pip install flask"

  network_interface {
    subnetwork = google_compute_subnetwork.subnetwork.id

    access_config {
      # Include this section to give the VM an external IP address
    }
  }
}

resource "google_compute_firewall" "ssh-firewall" {
  name = "${lower(var.app_name)}-${var.app_environment}-ssh-firewall"
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  direction     = "INGRESS"
  network       = google_compute_network.vpc_network.id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}

resource "google_compute_firewall" "flask-firewall" {
  name    = "${lower(var.app_name)}-${var.app_environment}-flask-app-firewall"
  network = google_compute_network.vpc_network.id

  allow {
    protocol = "tcp"
    ports    = ["5000"] # Flask entrega el tráfico en localhost:5000 de forma predeterminada.
  }
  source_ranges = ["0.0.0.0/0"]
}
