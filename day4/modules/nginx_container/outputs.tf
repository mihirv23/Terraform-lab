output "container_url" {
  description = "The local URL to access the container"
  value       = "http://localhost:${var.container_port}"
}