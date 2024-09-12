terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"  # Specify a stable version
    }
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source  = "./modules/resource_group"
  name    = "example-resource-group"
  location = "West US"
}

module "vnet" {
  source              = "./modules/vnet"
  name                = "example-vnet"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.0.0.0/16"]
  subnet_name         = "example-subnet"
  subnet_address_prefix = "10.0.0.0/24"
}

module "vm" {
  source                = "./modules/vm"
  vm_name              = "example-vm"
  resource_group_name  = module.resource_group.name
  location             = module.resource_group.location
  vm_size              = "Standard_B1s"
  admin_username       = "azureuser"
  admin_password       = "P@ssw0rd1234"  # Use a more secure way to manage passwords
  subnet_id            = module.vnet.subnet_id
}
