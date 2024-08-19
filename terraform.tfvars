location             = "East US"
resource_group_name  = "example-rg"
vnet_name            = "example-vnet"
vnet_address_space   = ["10.0.0.0/16"]
subnet_name          = "example-subnet"
subnet_address_prefixes = ["10.0.1.0/24"]
vm_name              = "example-vm"
admin_username       = "adminuser"
admin_password       = "P@ssw0rd1234!"
nic_name             = "example-nic"
ip_config_name       = "example-ipconfig"
cosmosdb_name        = "example-cosmosdb"
storage_account_name = "examplestorageacct"
app_service_plan_name = "example-appserviceplan"
webapp_name          = "example-webapp"
app_settings = {
  "WEBSITE_RUN_FROM_PACKAGE" = "1"
}
