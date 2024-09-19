resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  subnet {
    name           = var.subnet_name
    address_prefixes = tolist([var.subnet_address_prefix])
  }
}
