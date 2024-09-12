resource "azurerm_virtual_machine" "example" {
  count                = 3  # This creates three instances of the azurerm_virtual_machine resource.
  name                 = "example-vm-${count.index}"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example[count.index].id]
  vm_size              = "Standard_DS1_v2"

  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "hostname-${count.index}"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}