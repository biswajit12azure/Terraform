esource "azurerm_virtual_machine" "example" {
  name                 = "example-vm"
  location             = azurerm_resource_group.example.location
  resource_group_name  = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size              = "Standard_DS1_v2"

  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  connection {
    type        = "ssh"
    user        = "adminuser"
    private_key = file("~/.ssh/id_rsa")
    host        = azurerm_public_ip.example.ip_address
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
    ]
  }
}
# This defines an SSH connection for the provisioner to use on the Azure VM.
