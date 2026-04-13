output "cluster_name" {
  description = "GKE Cluster name"
  value       = google_container_cluster.primary.name
}

output "cluster_endpoint" {
  description = "GKE Cluster endpoint"
  value       = google_container_cluster.primary.endpoint
  sensitive   = true
}

output "region" {
  description = "GCP Region"
  value       = var.region
}
