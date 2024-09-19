provider "azurerm" {
  features {}
  subscription_id = "d87b0440-7342-4f1b-aa3a-83f0e1745c41"
}

# Define the Resource Group
resource "azurerm_resource_group" "example" {
  name     = "biswa-resources1"
  location = "West US"
}

# Define the Virtual Network
resource "azurerm_virtual_network" "example" {
  name                = "example-vnet1"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
}

# Define the Subnet
resource "azurerm_subnet" "example" {
  name                 = "example-subnet1"
  resource_group_name  = azurerm_resource_group.example.name
  virtual_network_name = azurerm_virtual_network.example.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Define the Public IP for the VM
resource "azurerm_public_ip" "example" {
  name                = "example-public-ip1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
}

# Define the Network Interface for the VM
resource "azurerm_network_interface" "example" {
  name                = "example-nic1"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.example.id
  }
}

resource "azurerm_virtual_machine" "example" {
  name                  = "examplevm1"
  location              = azurerm_resource_group.example.location
  resource_group_name   = azurerm_resource_group.example.name
  network_interface_ids = [azurerm_network_interface.example.id]
  vm_size               = "Standard_DS1_v2"

  # Operating System Profile
  os_profile {
    computer_name  = "hostname"
    admin_username = "adminuser"
    admin_password = "Password1234!"
  }
  
# Linux Configuration
  os_profile_linux_config {
    disable_password_authentication = false
  }

  # OS Disk
  storage_os_disk {
    name              = "example-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # Image (Ubuntu 18.04)
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }


  provisioner "local-exec" {
    command = "echo ${azurerm_virtual_machine.example.id} > vm_id.txt"
  }
}
