variable "environment" {
  default = "dev"
}

variable "storage_account_skus" {
  type = map(string)
  default = {
    "dev"  = "Standard_LRS"
    "prod" = "Standard_GRS"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "storageacct${random_string.example.result}"
  resource_group_name       = azurerm_resource_group.example.name
  location                  = azurerm_resource_group.example.location
  account_tier              = "Standard"
  account_replication_type  = lookup(var.storage_account_skus, var.environment, "Standard_LRS")
}
