variable "container_name" {
  description = "The name of the Docker container"
  type        = string
}

variable "container_port" {
  description = "The external port to expose"
  type        = number
}

variable "image_name" {
  description = "The Docker image to use"
  type        = string
  default     = "nginx:latest"
}