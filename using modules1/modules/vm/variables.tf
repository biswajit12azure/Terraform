variable "vm_name" {
  description = "The name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "The admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "The admin password for the virtual machine"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "The name of the resource group to which the virtual machine belongs"
  type        = string
}

variable "location" {
  description = "The location/region where the virtual machine should exist"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet where the network interface should be created"
  type        = string
}
