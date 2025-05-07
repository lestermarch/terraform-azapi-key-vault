# Azure Key Vault (AzAPI)

A Terraform module for deploying an Azure Key Vault using the AzAPI provider.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~> 2.3.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 2.3.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.7.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azapi_resource.key_vault](https://registry.terraform.io/providers/Azure/azapi/latest/docs/resources/resource) | resource |
| [random_integer.resource_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/integer) | resource |
| [random_pet.resource_suffix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The region into which resources will be deployed. | `string` | n/a | yes |
| <a name="input_public_endpoint"></a> [public\_endpoint](#input\_public\_endpoint) | An object defining the public endpoint configuration for the key vault, in the format:<pre>{<br/>  enabled = true<br/>  firewall = {<br/>    enabled    = true<br/>    ip_ranges  = ["90.80.70.60/24"]<br/>    subnet_ids = ["/subscriptions/.../virtualNetworks/vnet-example/subnets/ExampleSubnet"]<br/>}</pre>The public endpoint is disabled by default. | <pre>object({<br/>    enabled = optional(bool, false)<br/>    firewall = optional(object({<br/>      enabled    = optional(bool, true)<br/>      ip_ranges  = optional(list(string), [])<br/>      subnet_ids = optional(list(string), [])<br/>    }))<br/>  })</pre> | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | The ID of the resource group into which resources will be deployed. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the key vault. | `string` | `null` | no |
| <a name="input_resource_tags"></a> [resource\_tags](#input\_resource\_tags) | A map of key-value pairs to use as resource tags. | `map(string)` | `null` | no |
| <a name="input_sku"></a> [sku](#input\_sku) | The SKU of the key vault. | `string` | `"Standard"` | no |
| <a name="input_soft_delete"></a> [soft\_delete](#input\_soft\_delete) | An object defining the soft delete configuration for the key vault, in the format:<pre>{<br/>  retention_day = 90<br/>}</pre>Soft delete is enabled for 30 days by default. | <pre>object({<br/>    enabled        = optional(bool, true)<br/>    retention_days = optional(number, 30)<br/>  })</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_vault_id"></a> [key\_vault\_id](#output\_key\_vault\_id) | The ID of the key vault. |
| <a name="output_key_vault_uri"></a> [key\_vault\_uri](#output\_key\_vault\_uri) | The URI of the key vault. |
<!-- END_TF_DOCS -->
