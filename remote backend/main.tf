provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

terraform {
  backend "azurerm" {}
}

# Resource Group 1
resource "azurerm_resource_group" "rg1" {
  name     = "example-resource-group-1"
  location = "West US"
}


# App Service Plan 1
resource "azurerm_app_service_plan" "asp1" {
  name                = "example-app-service-plan-1"
  location            = azurerm_resource_group.rg1.location
  resource_group_name = azurerm_resource_group.rg1.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}