/* Common variables */
variable "project_id" {
  description = "Project ID to create resources in."
  type        = string
  default     = "devops-test-vm-terraform"
}

variable "region" {
  description = "Region to place compute resources at."
  type        = string
  default     = "europe-west2"
}

variable "zone" {
  description = "Zone to place compute resource at."
  type        = string
  default     = "europe-west2-c"
}

variable "network" {
  description = "Network to create compute resources in."
  type        = string
  default     = "default"
}

variable "subnetwork" {
  description = "Subnet to create compute resources in."
  type        = string
  default     = "default"
}

variable "machine_type" {
  description = "Machine type for GCE instance."
  type        = string
  default     = "e2-standard-2"
}

variable "machine_name" {
  description = "Compute Instance name."
  type        = string
  default     = "devops-test-vm"
}