terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

# Pulls the image [cite: 82]
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

# Creates the container [cite: 83]
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "tutorial"

  ports {
    internal = 80
    external = 8080 # Maps container port 80 to host port 8080 [cite: 84]
  }
}

# Output the URL [cite: 88]
output "service_url" {
  value = "http://localhost:8080"
}