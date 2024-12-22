# This is used to populate the root_parent_id variable with the
# current Tenant ID used as the ID for the "Tenant Root Group"
# management group.

# Get the current client configuration from the AzureRM provider
data "azurerm_client_config" "current" {
  provider = azurerm
}

# Get the current subscription data from the AzureRM provider
data "azurerm_subscription" "current" {}