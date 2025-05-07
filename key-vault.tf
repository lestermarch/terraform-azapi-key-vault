# Create the key vault
resource "azapi_resource" "key_vault" {
  type = "Microsoft.KeyVault/vaults@2024-11-01"

  name      = local.name
  location  = var.location
  parent_id = var.resource_group_id
  tags      = var.resource_tags

  body = {
    properties = {
      enableRbacAuthorization   = true
      enableSoftDelete          = var.soft_delete.enabled
      sku                       = local.sku
      softDeleteRetentionInDays = var.soft_delete.retention_days
      tenantId                  = data.azapi_client_config.current.tenant_id
    }
  }
}
