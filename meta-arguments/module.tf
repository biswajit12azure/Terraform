module "network" {
  source  = "Azure/network/azurerm"
  version = "2.0.0"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  vnet_name           = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  subnet_prefixes     = ["10.0.1.0/24"]
  subnet_names        = ["subnet1"]
}
# This example calls a network module from the Terraform Registry.
