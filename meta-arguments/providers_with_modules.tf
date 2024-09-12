module "multi_region" {
  source  = "./module"
  providers = {
    azurerm.eastus = azurerm.eastus
    azurerm.westus = azurerm.westus
  }
}
# This specifies that the module should use different Azure provider configurations for different regions (eastus and westus).