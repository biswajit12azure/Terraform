variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "demoResourceGroup"
}

variable "location" {
  description = "The Azure region to create the resources in"
  type        = string
  default     = "West US"
}

variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
  default     = "demoVM"
}

variable "admin_username" {
  description = "The admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "The admin password for the VM"
  type        = string
  default     = "P@ssw0rd1234!"
  sensitive   = true
}

variable "vm_size" {
  description = "The size of the VM"
  type        = string
  default     = "Standard_B1s"
}

variable "image_publisher" {
  description = "The publisher of the image"
  type        = string
  default     = "Canonical"
}

variable "image_offer" {
  description = "The offer of the image"
  type        = string
  default     = "UbuntuServer"
}

variable "image_sku" {
  description = "The SKU of the image"
  type        = string
  default     = "18.04-LTS"
}

variable "image_version" {
  description = "The version of the image"
  type        = string
  default     = "latest"
}
