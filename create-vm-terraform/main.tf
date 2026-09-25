resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "google_storage_bucket" "project_bucket" {
  name                        = "${var.project_id}-${random_id.bucket_suffix.hex}"
  location                    = var.region
  force_destroy               = true
  uniform_bucket_level_access = true

  public_access_prevention = "enforced"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "google_bigquery_dataset" "project_dataset" {
  dataset_id    = "project_dataset"
  friendly_name = "Project Dataset"
  description   = "Dataset created for app and analytics workloads"
  location      = var.region
  delete_contents_on_destroy = true

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}

resource "google_compute_instance" "vm_instance" {
  project      = var.project_id
  name         = var.machine_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network    = var.network
    subnetwork = var.subnetwork

    access_config {
      // Ephemeral public IP
    }
  }

  tags = ["ssh", "devops-course"]

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}