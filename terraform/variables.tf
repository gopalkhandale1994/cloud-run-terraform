variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
  default     = var.project_id != "" ? var.project_id : "default"
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = var.region != "" ? var.region : "us-central1"
}

variable "image" {
  description = "The Docker image to deploy"
  type        = string
  default     = var.image != "" ? var.image : "us-central1-docker.pkg.dev/avian-bricolage-429512-k8/my-repo/hello-world:latest"
}
