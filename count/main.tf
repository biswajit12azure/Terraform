provider "azurerm" {
  features {}
}

variable "app_service_plan_count" {
  description = "Number of App Service Plans to create"
  type        = number
  default     = 6
}

resource "azurerm_resource_group" "example" {
  name     = "emy-resources"
  location = "East US"
}

resource "azurerm_service_plan" "example" {
  count               = var.app_service_plan_count
  name                = "example-app-service-plan-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"  # or "Linux" depending on your needs
  sku_name            = "S1"       # Specify the SKU name directly
}

output "service_plan_names" {
  value = azurerm_service_plan.example[*].name
}
