provider "google" {
  version = "2.15"
  project = var.project
  region  = var.region
}


resource "google_compute_instance" "app" {
  count = 1 # create count similar instances
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

  provisioner "remote-exec" {
    script = "/9868-08_infra/docker-monolith/infra/docker.sh"
  }
  connection {
    type        = "ssh"
    host        = google_compute_instance.app[count.index].network_interface.0.access_config.0.nat_ip
    user        = "appuser"
    agent       = "false"
    private_key = file(var.private_key_path)
  }
}


