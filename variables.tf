variable "location" {
  description = "The region into which resources will be deployed."
  nullable    = false
  type        = string
}

variable "name" {
  default     = null
  description = "The name of the key vault."
  type        = string
}

variable "public_endpoint" {
  description = <<-EOT
  An object defining the public endpoint configuration for the key vault, in the format:
  ```
  {
    enabled = true
    firewall = {
      enabled    = true
      ip_ranges  = ["90.80.70.60/24"]
      subnet_ids = ["/subscriptions/.../virtualNetworks/vnet-example/subnets/ExampleSubnet"]
  }
  ```
  The public endpoint is disabled by default.
  EOT
  type = object({
    enabled = optional(bool, false)
    firewall = optional(object({
      enabled    = optional(bool, true)
      ip_ranges  = optional(list(string), [])
      subnet_ids = optional(list(string), [])
    }))
  })
}

variable "resource_group_id" {
  description = "The ID of the resource group into which resources will be deployed."
  nullable    = false
  type        = string
}

variable "resource_tags" {
  default     = null
  description = "A map of key-value pairs to use as resource tags."
  type        = map(string)
}

variable "sku" {
  default     = "Standard"
  description = "The SKU of the key vault."
  type        = string

  validation {
    condition     = contains(["Standard", "Premium"], var.sku)
    error_message = "The SKU must be either 'Standard' or 'Premium'."
  }
}

variable "soft_delete" {
  default     = null
  description = <<-EOT
  An object defining the soft delete configuration for the key vault, in the format:
  ```
  {
    retention_day = 90
  }
  ```
  Soft delete is enabled for 30 days by default.
  EOT
  type = object({
    enabled        = optional(bool, true)
    retention_days = optional(number, 30)
  })

  validation {
    condition     = var.soft_delete.retention_days >= 7 && var.soft_delete.retention_days <= 90
    error_message = "The retention days for soft delete must be between 7 and 90 days."
  }
}
