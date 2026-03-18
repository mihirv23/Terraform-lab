variable "message" {
  type    = string
  default = "Hello from Terraform"
}

# Keep ONLY this block. Delete any other "local_file" "hello" blocks.
resource "local_file" "hello" {
  filename = "${path.module}/hello.txt"
  content  = var.message
}

output "file_path" {
  value = local_file.hello.filename
}