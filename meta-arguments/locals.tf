locals {
  base_name = "example"
}

resource "azurerm_virtual_machine" "example" {
  name                 = local.base_name
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_DS1_v2"
}
# Local values simplify the reuse of common strings or calculations across resources.