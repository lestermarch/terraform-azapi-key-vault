output "key_vault_id" {
  description = "The ID of the key vault."
  value       = azapi_resource.key_vault.id
}

output "key_vault_uri" {
  description = "The URI of the key vault."
  value       = azapi_resource.key_vault.body.properties.vaultUri
}
