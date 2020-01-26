variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable machine_type {
  description = "Type of virtual machine instance for app"
  default     = "g1-small"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access"
}

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}

variable reddit_db_ip {
  description = "Internal IP address of reddit-db instance"
  default     = "0.0.0.0"
}

variable provisioners_enabled {
  description = "Provisoners toggle"
}
