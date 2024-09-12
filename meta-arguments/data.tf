data "azurerm_resource_group" "example" {
  name = "existing-rg"
}

data "azurerm_virtual_network" "example" {
  name                = "existing-vnet"
  resource_group_name = data.azurerm_resource_group.example.name
}

# This fetches the details of an existing resource group and virtual network from Azure.
