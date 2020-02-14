provider "google" {
  version = "2.15"
  project = var.project
  region  = var.region
}


resource "google_compute_instance" "app" {
  count = 3 # create count similar instances
  name = "app${count.index}"

  machine_type = var.machine_type
  zone         = "europe-west1-b"
  boot_disk {
    initialize_params {
      image = var.app_disk_image
    }
  }
  network_interface {
    network = "default"
    access_config {}
    // Ephemeral IP
  }
  metadata = {
    ssh-keys = file(var.public_key_path)
  }
}


