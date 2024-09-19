# Define the provider
provider "azurerm" {
  features {}

  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}


resource "azurerm_resource_group" "demo_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "demo_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
}

resource "azurerm_subnet" "demo_subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.demo_rg.name
  virtual_network_name = azurerm_virtual_network.demo_vnet.name
  address_prefixes     = [var.subnet_address_prefix]
}
