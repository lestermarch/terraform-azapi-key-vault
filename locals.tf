locals {
  # Determine the name of the key vault
  name = coalesce(var.name, "kv-${local.resource_suffix}")

  # Create a data structure for the network ACL configuration as required by the Azure API
  public_endpoint_firewall = {
    bypass        = "AzureServices"
    defaultAction = var.public_endpoint.firewall.enabled ? "Deny" : "Allow"

    ipRules = [
      for ip_range in var.public_endpoint.firewall.ip_ranges : {
        value = ip_range
      }
    ]

    virtualNetworkRules = [
      for subnet_id in var.public_endpoint.firewall.subnet_ids : {
        id                               = subnet_id
        ignoreMissingVnetServiceEndpoint = true
      }
    ]
  }

  # Determine if the public endpoint should be enabled
  public_endpoint_mode = var.public_endpoint.enabled ? "Enabled" : "Disabled"

  # Generate a resource suffix for resources where a resource name is not provided
  resource_suffix = "${random_pet.resource_suffix.id}-${random_integer.resource_suffix.id}"

  # Create a data structure for the SKU configuration as required by the Azure API
  sku = {
    family = "A"
    name   = lower(var.sku)
  }
}
