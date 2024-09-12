provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

variable "environment" {
  description = "The environment type (dev or prod)"
  default     = "dev"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  default     = "example-rg"
}

variable "location" {
  description = "Azure region"
  default     = "East US"
}

# Conditional VNet based on environment
resource "azurerm_virtual_network" "example_vnet" {
  name                = "exampleVNet"
  location            = var.location
  resource_group_name = var.resource_group_name
  
  # Use a larger address space in production, smaller in development
  address_space = var.environment == "prod" ? ["10.0.0.0/16"] : ["10.0.0.0/24"]

  # Optionally create different DNS servers depending on the environment
  dns_servers = var.environment == "prod" ? ["10.0.0.4", "10.0.0.5"] : []
}

resource "azurerm_subnet" "example_subnet" {
  name                 = "exampleSubnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.example_vnet.name
  
  # Smaller subnet for dev, larger for prod
  address_prefixes     = var.environment == "prod" ? ["10.0.1.0/24"] : ["10.0.1.0/26"]
}

output "vnet_address_space" {
  value = azurerm_virtual_network.example_vnet.address_space
}
