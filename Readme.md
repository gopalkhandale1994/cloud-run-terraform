# Cloud Run Deployment with Terraform

This project provides a simple setup to deploy a "Hello World" application to Google Cloud Run using Terraform.

## Project Structure

- **app/**: Contains the Dockerfile and application code.
- **terraform/**: Contains Terraform configuration files.
- **.gitignore**: Specifies files and directories to be ignored by Git.
- **README.md**: Main project README with high-level instructions and overview.

## Prerequisites

- Google Cloud SDK installed and authenticated.
- Terraform installed.
- Docker installed.

## Setup and Deploy

### Steps

1. **Create a new GCP project** and set it as the active project:

    gcloud auth login
    gcloud projects create project_id
    gcloud config set project project_id


2. **Enable required APIs**:

    gcloud services enable run.googleapis.com
    gcloud services enable cloudbuild.googleapis.com
    gcloud services enable artifactregistry.googleapis.com


3. **Create a Docker repository in Artifact Registry**:

    gcloud artifacts repositories create my-repo \
        --repository-format=docker \
        --location=us-central1


4. **Build and push the Docker image**:

    cd app
    docker build -t us-central1-docker.pkg.dev/project_id/my-repo/hello-world:latest .
    gcloud auth configure-docker us-central1-docker.pkg.dev
    docker push us-central1-docker.pkg.dev/project_id/my-repo/hello-world:latest


5. **Deploy using Terraform**:

    cd ../terraform
    terraform init
    terraform apply -var="project_id=...." -var="image=us-central1-docker.pkg.dev/project_id/my-repo/hello-world:latest"


6. **Access the Cloud Run service**: After applying the Terraform configuration, the service URL will be output.
url = "https://hello-world-juuyfgzosa-uc.a.run.app"
## Notes

- Ensure you have set up your GCP project and enabled the necessary APIs.
- The Docker image is built from the provided Dockerfile and pushed to Google Artifact Registry before running the Terraform scripts.
