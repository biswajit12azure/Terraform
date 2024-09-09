# Define the provider
provider "azurerm" {
  features {}
}

# Define a resource
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "East US"
}

# Define output
output "resource_group_name" {
  value = azurerm_resource_group.example.name
}
