variable "location" {
  type    = string
  default = "East US"
}

variable "resource_group_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_name" {
  type = string
}

variable "subnet_address_prefixes" {
  type = list(string)
}

variable "vm_name" {
  type = string
}

variable "vm_size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "admin_username" {
  type = string
}

variable "admin_password" {
  type      = string
  sensitive = true
}

variable "nic_name" {
  type = string
}

variable "ip_config_name" {
  type = string
}

variable "cosmosdb_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "app_service_plan_name" {
  type = string
}

variable "webapp_name" {
  type = string
}

variable "app_settings" {
  type    = map(string)
  default = {}
}
