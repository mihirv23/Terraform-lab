terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
    }
  }
}

provider "docker" {}

# The Magic Variable: Define your "Cluster" here
variable "server_map" {
  type = map(object({
    ext_port = number
  }))
  default = {
    "alpha" = { ext_port = 9081 }
    "beta"  = { ext_port = 9082 }
    "gamma" = { ext_port = 8083 }
    "delta" = { ext_port = 8084 }
  }
}

# The for_each loop: Creates one instance for every item in the map
module "nginx_cluster" {
  for_each = var.server_map
  source   = "../day4/modules/nginx_container"

  container_name = "bonus-${each.key}"
  container_port = each.value.ext_port
  image_name     = "nginx:latest"
}

# Dynamic Output: Lists all URLs automatically
output "cluster_urls" {
  value = { for name, config in module.nginx_cluster : name => "http://localhost:${var.server_map[name].ext_port}" }
}