variable "admin_password" {
  description = "The admin password"
  type        = string
  sensitive   = true
}

output "admin_password" {
  value     = var.admin_password
  sensitive = true
}
# This helps in managing sensitive information such as passwords.