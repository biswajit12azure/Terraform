variable "zones" {
  type    = list(string)
  default = ["1", "2", "3"]
}

resource "azurerm_linux_virtual_machine" "example" {
  count               = 3
  name                = "vm-${count.index}"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  availability_zone   = element(var.zones, count.index)
  size                = "Standard_DS1_v2"
  admin_username      = "adminuser"
  network_interface_ids = [azurerm_network_interface.example[count.index].id]
}
