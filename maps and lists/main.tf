provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

resource "random_string" "random" {
  length  = 8
  special = false
  upper   = false

}

resource "azurerm_storage_account" "example" {
  name                     = "examplestorage${random_string.random.result}"
  resource_group_name      = var.storage_account_config[var.environment].resource_group_name
  location                 = var.storage_account_config[var.environment].location
  account_tier             = var.storage_account_config[var.environment].account_tier
  account_replication_type = var.storage_account_config[var.environment].replication_types[0]  # Fetch first replication type
}
