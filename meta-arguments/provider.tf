# This resource will use the azurerm.eastus provider configuration.
provider "azurerm" {
  alias   = "eastus"
  features {}
  location = "East US"
}

resource "azurerm_resource_group" "example" {
  provider            = azurerm.eastus
  name                = "example-resources"
  location            = "East US"
}
