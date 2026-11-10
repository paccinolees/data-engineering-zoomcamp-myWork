variable "credentials" {
  description = "My Credentials"
  default     = "<Path to your Service Account json file>"
  #ex: if you have a directory where this file is called keys with your service account json file
  #saved there as my-creds.json you could use default = "./keys/my-creds.json"
}

variable "project" {
  description = "Project"
  default     = "project-10819822-1a19-4dd0-b92"
}

variable "region" {
  description = "Region"
  default     = "asia-southeast3"
}

variable "location" {
  description = "Project's Location"
  default     = "asia-southeast3"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "demo_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "project-10819822-1a19-4dd0-b92-terra-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}
