variable zone {
  description = "Zone"
  default     = "europe-west1-b"
}

variable machine_type {
  description = "Type of virtual machine instance for db"
  default     = "g1-small"
}

variable public_key_path {
  description = "Path to the public key used for ssh access"
}

variable private_key_path {
  description = "Path to the private key used for ssh access. Used by travis only"
  default     = "/home/dinky/.ssh/appuser"
}


variable db_disk_image {
  description = "Disk image for reddit DB"
  default     = "projects/forward-karma-262407/global/images/reddit-base-1578467159"
}

variable provisioners_enabled {
  description = "Provisoners toggle"
  default     = "3"
}

