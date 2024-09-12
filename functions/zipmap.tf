variable "vm_names" {
  type    = list(string)
  default = ["web-server", "db-server", "app-server"]
}

variable "vm_sizes" {
  type    = list(string)
  default = ["Standard_B1ms", "Standard_B2ms", "Standard_B1s"]
}

locals {
  vm_map = zipmap(var.vm_names, var.vm_sizes)
}

resource "azurerm_linux_virtual_machine" "example" {
  for_each            = local.vm_map
  name                = each.key
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  size                = each.value
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.example.id]
}
