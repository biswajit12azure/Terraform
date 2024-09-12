resource "azurerm_network_interface" "example" {
  for_each            = {
    vm1 = "10.0.1.4"
    vm2 = "10.0.1.5"
  }
  name                = "example-nic-${each.key}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Static"
    private_ip_address            = each.value
  }
}

# This creates two azurerm_network_interface resources with different static IP addresses.