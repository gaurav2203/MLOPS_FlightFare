variable "project_id"{
  type=string
}

variable "cluster_name"{
  type=string
}

variable "region"{
  type=string
}

resource "google_service_account" "default" {
  account_id   = var.project_id
}

resource "google_container_cluster" "gke" {
  name= var.cluster_name
  location= var.region
  remove_default_node_pool = true
  initial_node_count= 1
  node_config {
    service_account= google_service_account.default.email
    oauth_scopes= [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    labels= {
      name= var.cluster_name
      }
  }
}

resource "google_container_node_pool" "gke_nodes" {
  name       = "my-node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes    = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


