variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
  default     = "avian-bricolage-429512-k8"
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "The Docker image to deploy"
  type        = string
  default     = "us-central1-docker.pkg.dev/avian-bricolage-429512-k8/my-repo/hello-world:latest"
}
