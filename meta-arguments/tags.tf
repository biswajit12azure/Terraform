resource "azurerm_virtual_machine" "example" {
  name                 = "example-vm"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_DS1_v2"

  tags = {
    Environment = "Production"
    Department  = "IT"
  }
}
# Tags can be applied to most Azure resources and help with cost management, access control, and more.
