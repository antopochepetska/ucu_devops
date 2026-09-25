terraform {
    required_version = ">= 1.5.0"
    backend "gcs" {
        bucket = "devops-test-vm-terraform-tfstate"
        prefix = "terraform/state"
  }
}