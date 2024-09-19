provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

# List of storage account names
variable "storage_account_names" {
  type    = list(string)
  default = ["storageacctky1", "storageacctky2", "storageacctky3"]
}

# List of SKUs for the storage accounts
variable "storage_account_skus" {
  type    = list(string)
  default = ["Standard_LRS", "Standard_GRS", "Premium_LRS"]
}

# Create a map between account names and SKUs
locals {
  storage_account_map = zipmap(var.storage_account_names, var.storage_account_skus)
}

resource "azurerm_resource_group" "example" {
  name     = "b2-resources"
  location = "East US"
}

# Create storage accounts using the zipmap
resource "azurerm_storage_account" "example" {
  for_each             = local.storage_account_map
  name                 = each.key
  resource_group_name  = azurerm_resource_group.example.name
  location             = azurerm_resource_group.example.location
  account_tier         = split("_", each.value)[0]  # Extracting "Standard" or "Premium"
  account_replication_type = split("_", each.value)[1]  # Extracting replication type, e.g., "LRS" or "GRS"
}
