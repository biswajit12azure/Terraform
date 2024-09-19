provider "azurerm" {
  version = "3.116.0"
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}


locals {
  base_name = "example1"
}

# Define a resource
resource "azurerm_resource_group" "example" {
  name     = local.base_name
  location = "East US"
}

# Define output
output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
