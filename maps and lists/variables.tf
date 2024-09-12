variable "storage_account_config" {
  type = map(object({
    resource_group_name = string
    location            = string
    account_tier        = string
    replication_types   = list(string)
  }))

  default = {
    "dev" = {
      resource_group_name = "devbiswarg"
      location            = "East US"
      account_tier        = "Standard"
      replication_types   = ["LRS", "GRS"]  # List of replication types for dev
    }
    "prod" = {
      resource_group_name = "prodbiswarg"
      location            = "West Europe"
      account_tier        = "Premium"
      replication_types   = ["ZRS", "RAGRS"]  # List of replication types for prod
    }
  }
}

variable "environment" {
  type    = string
  default = "dev"  # Change this to "prod" for production configuration
}
