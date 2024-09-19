provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

variable "app_service_plan_count" {
  description = "Number of App Service Plans to create"
  type        = number
  default     = 6
}

variable "sku_name" {
  type    = list(string)
  default = ["B1", "S2", "F1"]
}
resource "azurerm_resource_group" "example" {
  name     = "b1-resources"
  location = "East US"
}

resource "azurerm_service_plan" "example" {
  count               = var.app_service_plan_count
  name                = "app-service-plan-${count.index}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  os_type             = "Windows"                          # or "Linux" depending on your needs
  sku_name            = element(var.sku_name, count.index) # Defining through element function
}

output "service_plan_names" {
  value = azurerm_service_plan.example[*].name
}
