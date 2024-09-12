provider "azurerm" {
  features {}
}

# Resource Group 1
resource "azurerm_resource_group" "rg1" {
  name     = "example-resource-group-1"
  location = "West US"
}

# Resource Group 2
resource "azurerm_resource_group" "rg2" {
  name     = "example-resource-group-2"
  location = "East US"
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

# App Service Plan 2
resource "azurerm_app_service_plan" "asp2" {
  name                = "example-app-service-plan-2"
  location            = azurerm_resource_group.rg2.location
  resource_group_name = azurerm_resource_group.rg2.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}
