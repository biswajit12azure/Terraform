provider "azurerm" {
  features {}
}

variable "storage_accounts" {
  description = "Map of storage account names and their configurations"
  type = map(object({
    location = string
    account_tier = string
    replication_type = string
  }))
  default = {
    biswastorage1 = {
      location        = "East US"
      account_tier    = "Standard"
      replication_type = "LRS"
    }
    biswastorage2 = {
      location        = "West Europe"
      account_tier    = "Standard"
      replication_type = "GRS"
    }
  }
}

resource "azurerm_storage_account" "example" {
  for_each             = var.storage_accounts
  name                 = "storage${each.key}"
  resource_group_name  = azurerm_resource_group.example.name
  location             = each.value.location
  account_tier         = each.value.account_tier
  account_replication_type = each.value.replication_type

}

resource "azurerm_resource_group" "example" {
  name     = "for-example-resources"
  location = "East US"
}

output "storage_account_names" {
  value = [for account in azurerm_storage_account.example : account.name]
}
