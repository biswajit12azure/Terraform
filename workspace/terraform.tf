provider "azurerm" {
  version = "3.116.0"
  features {}
}


variable "locations" {
  description = "Azure region for each environment"
  type        = map(string)
  default = {
    dev     = "East US"
    qa      = "West US"
    uat     = "Central US"
    prod    = "South India"
    default = "West Europe"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg-${terraform.workspace}" # Use workspace name in RG name
  location = var.locations[terraform.workspace]  # Use location based on workspace
}