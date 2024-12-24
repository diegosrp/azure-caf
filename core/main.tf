# Declare the Azure landing zones Terraform module
# and provide the configuration.
module "alz" {
  source  = "Azure/caf-enterprise-scale/azurerm"
  version = "6.2.0"

  providers = {
    azurerm              = azurerm
    azurerm.management   = azurerm
    azurerm.connectivity = azurerm
  }

  # Base module configuration settings
  root_parent_id   = data.azurerm_client_config.current.tenant_id
  root_id          = var.root_id
  root_name        = var.root_name
  default_location = var.primary_location

  # Subscriptions association to management groups 
  subscription_id_overrides = local.caf_configure_mg_subscriptions # settings.core.tf

  # Enable creation of the core management group hierarchy
  deploy_core_landing_zones = true
}