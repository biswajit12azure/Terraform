# Define the provider
provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

# Define a resource
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Define output
output "resource_group_name" {
  value = azurerm_resource_group.example.name
}

output "resource_group_location" {
  value = azurerm_resource_group.example.location
}