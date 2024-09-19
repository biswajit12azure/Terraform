provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

module "resource_group" {
  source  = "./modules/resource_group"
  name    = "kyndryl-resource-group"
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
