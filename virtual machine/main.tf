provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}

resource "azurerm_resource_group" "demo_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "demo_vnet" {
  name                = "demoVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name
}

resource "azurerm_subnet" "demo_subnet" {
  name                 = "demoSubnet"
  resource_group_name  = azurerm_resource_group.demo_rg.name
  virtual_network_name = azurerm_virtual_network.demo_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "demo_nic" {
  name                = "demoNIC"
  location            = azurerm_resource_group.demo_rg.location
  resource_group_name = azurerm_resource_group.demo_rg.name

  ip_configuration {
    name                          = "demoIPConfig"
    subnet_id                     = azurerm_subnet.demo_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "demo_vm" {
  name                  = var.vm_name
  location              = azurerm_resource_group.demo_rg.location
  resource_group_name   = azurerm_resource_group.demo_rg.name
  network_interface_ids = [azurerm_network_interface.demo_nic.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name              = "${var.vm_name}_os_disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  storage_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }

  os_profile {
    computer_name  = var.vm_name
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}
