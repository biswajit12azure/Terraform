provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-rg"
  location = "East US"
}

resource "azurerm_virtual_network" "example_vnet" {
  name          = "exampleVNet"
  location      = azurerm_resource_group.example.location
  address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "example_subnet" {
  name                 = "exampleSubnet"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}
