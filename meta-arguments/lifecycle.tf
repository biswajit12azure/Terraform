# This ensures that the storage account cannot be destroyed and that changes to the access_tier are ignored.
resource "azurerm_storage_account" "example" {
  name                     = "examplestoracc"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  lifecycle {
    prevent_destroy       = true
    ignore_changes        = [access_tier]
  }
}