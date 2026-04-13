variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Zone"
  type        = string
  default     = "europe-central2"
}

variable "cluster_name" {
  description = "GKE Cluster name"
  type        = string
  default     = "tomek-devops-portfolio-cluster"
}

variable "node_count" {
  description = "Number of nodes"
  type        = number
  default     = 2
}

variable "machine_type" {
  description = "GCP machine type"
  type        = string
  default     = "e2-small"
}
