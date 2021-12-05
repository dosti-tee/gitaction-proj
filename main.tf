resource "google_compute_network" "vpc_network" {
  name                    = "gitaction-network"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "vpc-subnetwork" {
  name          = "gitaction-subnet"
  ip_cidr_range = "192.168.32.0/24"
  region        = "europe-west1"
  network       = google_compute_network.vpc_network.name
}

resource "google_compute_firewall" "firewall-allow" {
  name = "gitaction-allow-http"
  network = google_compute_network.vpc_network.name
  source_ranges = [ "0.0.0.0/0" ]

  allow {
      protocol = "tcp"
      ports = ["22","80","8080"]
  }
}

resource "google_compute_instance" "first-instance" {
  name         = "gitaction-test-vm"
  zone         = "europe-west1-b"
  machine_type = "f1-micro"

  boot_disk {
      initialize_params {
          image = "debian-cloud/debian-9"
          size = "50"
      }
  }

  network_interface {
      network = google_compute_network.vpc_network.name
      subnetwork = google_compute_subnetwork.vpc-subnetwork.name
      access_config {
      }
  }

  metadata_startup_script = "apt-get update && apt install -yq apache2"
}
