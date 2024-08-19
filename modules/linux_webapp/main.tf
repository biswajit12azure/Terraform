resource "azurerm_linux_web_app" "webapp" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.service_plan_id

  site_config {
    linux_fx_version = "DOCKER|nginx"
  }

  app_settings = var.app_settings
}
