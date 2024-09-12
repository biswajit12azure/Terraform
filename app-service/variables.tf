variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "os_type" {
  description = "The OS type for the App Service Plan"
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "The SKU name for the App Service Plan"
  type        = string
  default     = "B1"  # Example: "B1", "S1", "P1v2"
}

variable "app_service_name" {
  description = "The name of the App Service"
  type        = string
}

variable "dotnet_version" {
  description = "The .NET runtime version for the Linux App Service"
  type        = string
  default     = "6.0"  # Example: "6.0" for .NET 6
}

variable "app_settings" {
  description = "The application settings for the App Service"
  type        = map(string)
  default = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
}
