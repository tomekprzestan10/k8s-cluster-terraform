# GKE Cluster
resource "google_container_cluster" "primary" {
  name     = var.cluster_name
  location = var.region

  # Usuwamy domyślny node pool i tworzymy własny
  remove_default_node_pool = true
  deletion_protection      = false
  initial_node_count       = 1

  network    = "default"
  subnetwork = "default"
}

# Node Pool – tutaj działają nasze aplikacje
resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.cluster_name}-node-pool"
  location   = var.region
  cluster    = google_container_cluster.primary.name
  node_count = var.node_count

  node_config {
    machine_type = var.machine_type
    disk_size_gb = 20
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "portfolio"
    }

    tags = ["gke-node", "devops-portfolio"]
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
