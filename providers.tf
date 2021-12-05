provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file("${path.module}/credentials.json")
}

# provider "random" {
# }