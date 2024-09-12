terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Specify a stable version
    }
  }
}

provider "azurerm" {
  features {}
}

# Data source to reference the existing resource group
data "azurerm_resource_group" "existing_rg" {
  name = "example-resources"
}

# Create an App Service Plan in the existing resource group
resource "azurerm_app_service_plan" "example_asp" {
  name                = "my-app-service-plan"
  location            = data.azurerm_resource_group.existing_rg.location
  resource_group_name = data.azurerm_resource_group.existing_rg.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}
