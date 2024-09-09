output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.demo_vnet.id
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.demo_vnet.name
}

output "vnet_address_space" {
  description = "The address space of the virtual network"
  value       = azurerm_virtual_network.demo_vnet.address_space
}

output "subnet_id" {
  description = "The ID of the subnet"
  value       = azurerm_subnet.demo_subnet.id
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.demo_subnet.name
}

output "subnet_address_prefix" {
  description = "The address prefix of the subnet"
  value       = azurerm_subnet.demo_subnet.address_prefixes
}
