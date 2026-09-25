output "bucket_url" {
  value       = "gs://${google_storage_bucket.project_bucket.name}"
  description = "The URL of the created GCS bucket."
}
output "dataset_id" {
  value       = google_bigquery_dataset.project_dataset.dataset_id
  description = "The ID of the created BigQuery dataset."
}
output "vm_internal_ip" {
  value       = google_compute_instance.vm_instance.network_interface[0].network_ip
  description = "The internal IP address of the created VM instance."
}
