locals {
  # Determine the name of the key vault
  name = coalesce(var.name, "kv-${local.resource_suffix}")

  # Generate a resource suffix for resources where a resource name is not provided
  resource_suffix = "${random_pet.resource_suffix.id}-${random_integer.resource_suffix.id}"

  # Create a data structure for the SKU configuration as required by the Azure API
  sku = {
    family = "A"
    name   = lower(var.sku)
  }
}
