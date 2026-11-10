terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "8.10.0"
    }
  }
}

provider "google" {
  # Configuration options
  ##credentials = "./keys/my-creds.json" #can connect creds like this as well(not preferred)
  project = var.project
  region  = var.region
}

resource "google_storage_bucket" "demo-bucket" {    #2nd arg here 'demo-bucket' is just a local var name of choice(doesnt hav to be globally uniq)
  name                        = var.gcs_bucket_name #must be globally uniq to whole GCP
  location                    = var.location        #default was US
  force_destroy               = true
  uniform_bucket_level_access = true

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}

resource "google_bigquery_dataset" "dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.location
}
