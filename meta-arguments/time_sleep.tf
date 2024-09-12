resource "time_sleep" "wait_for_vm" {
  depends_on = [azurerm_virtual_machine.example]
  create_duration = "60s"
}
# This introduces a 60-second delay after the VM is created, which can be useful if the VM takes time to become fully operational.