variable "storage_resource_group_name" {
  description = "The name of the resource group to create the storage account in"
  type        = string
}

variable "storage_location" {
  description = "The Azure region to create the storage account in"
  type        = string
  default     = "West US"
}

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

variable "container_name" {
  description = "The name of the storage container"
  type        = string
}
