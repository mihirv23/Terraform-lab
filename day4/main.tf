terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

module "app_server_1" {
  source         = "./modules/nginx_container"
  container_name = "server-8081"
  container_port = 8081
  image_name     = "nginx:latest"
}

module "app_server_2" {
  source         = "./modules/nginx_container"
  container_name = "server-8082"
  container_port = 8082
  image_name     = "nginx:latest"
}

# The Lab asks for an output of all URLs
output "container_urls" {
  value = [
    module.app_server_1.container_url,
    module.app_server_2.container_url
  ]
}