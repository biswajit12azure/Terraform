provider "azurerm" {
  features = {}
}

module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/virtual_network"
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg.name
  subnet_name         = var.subnet_name
  subnet_address_prefixes = var.subnet_address_prefixes
}

module "vm" {
  source                = "./modules/virtual_machine"
  name                  = var.vm_name
  location              = module.resource_group.location
  resource_group_name   = module.resource_group.rg.name
  subnet_id             = module.vnet.subnet.id
  vm_size               = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  nic_name              = var.nic_name
  ip_config_name        = var.ip_config_name
}

module "cosmosdb" {
  source              = "./modules/cosmosdb"
  name                = var.cosmosdb_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg.name
}

module "storage_account" {
  source              = "./modules/storage_account"
  name                = var.storage_account_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg.name
}

module "app_service_plan" {
  source              = "./modules/app_service_plan"
  name                = var.app_service_plan_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg.name
}

module "linux_webapp" {
  source              = "./modules/linux_webapp"
  name                = var.webapp_name
  location            = module.resource_group.location
  resource_group_name = module.resource_group.rg.name
  service_plan_id     = module.app_service_plan.asp.id
  app_settings        = var.app_settings
}
