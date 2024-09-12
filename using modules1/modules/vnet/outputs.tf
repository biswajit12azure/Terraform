output "subnet_id" {
  description = "The ID of the subnet."
  value       = tolist(azurerm_virtual_network.this.subnet)[0].id
}
