provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "./modules/resource_group"
  name    = "chetu-resource-group"
  location = "East US"
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "my-vnet"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "my-subnet"
  subnet_address_prefix = "10.0.0.0/24"
}
