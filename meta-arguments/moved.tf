moved {
  from = azurerm_virtual_machine.example
  to   = azurerm_virtual_machine.new_example
}
# This ensures that Terraform knows a resource has been moved and can manage it appropriately during subsequent apply operations.