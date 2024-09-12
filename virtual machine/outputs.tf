output "vm_id" {
  description = "The ID of the virtual machine"
  value       = azurerm_virtual_machine.demo_vm.id
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_virtual_machine.demo_vm.name
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.demo_nic.private_ip_address
}
