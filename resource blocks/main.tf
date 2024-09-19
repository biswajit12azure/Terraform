terraform {
  backend "azurerm" {
    resource_group_name   = "tf-rg"
    storage_account_name  = "tfstatek123"
    container_name        = "tftstatek123"
    key                   = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

# Resource Group 1
resource "azurerm_resource_group" "rg1" {
  name     = "example-resource-group-4"
  location = "West US"
}

# Resource Group 2
resource "azurerm_resource_group" "rg2" {
  name     = "example-resource-group-3"
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
