provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}


resource "azurerm_resource_group" "example" {
  name     = "erg1"
  location = "East US"
}

variable "environment" {
  default = "dev"
}

variable "storage_account_skus" {
  type = map(string)
  default = {
    "dev"  = "LRS"
    "prod" = "GRS"
  }
}

resource "random_string" "example" {
  length  = 8
  special = false
  upper   = false

}

resource "azurerm_storage_account" "example" {
  name                     = "storageacct${random_string.example.result}"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = lookup(var.storage_account_skus, var.environment, "ZRS")
}
