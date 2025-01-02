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
  root_parent_id           = data.azurerm_client_config.current.tenant_id
  root_id                  = var.root_id
  root_name                = var.root_name
  default_location         = var.primary_location
  disable_base_module_tags = true
  disable_telemetry        = true

  # Subscriptions association to management groups 
  subscription_id_overrides = local.caf_configure_mg_subscriptions # settings.core.tf

  # Enable creation of the core management group hierarchy
  # and additional custom_landing_zones
  deploy_core_landing_zones = true
  custom_landing_zones      = local.caf_configure_custom_landing_zones # settings.core.tf

  # Configuration settings for identity resources is
  # bundled with core as no resources are actually created
  # for the identity subscription
  # subscription_id_identity     = var.subscriptions_ids["identity"]
  # configure_identity_resources = local.caf_configure_identity_resources
  deploy_identity_resources = false

  # The following inputs ensure that managed parameters are
  # configured correctly for policies relating to connectivity
  # resources created by the connectivity module instance and
  # to map the subscription to the correct management group,
  # but no resources are created by this module instance
  # subscription_id_connectivity     = data.terraform_remote_state.connectivity.outputs.subscription_id
  # configure_connectivity_resources = data.terraform_remote_state.connectivity.outputs.configuration
  deploy_connectivity_resources = false

  # The following inputs ensure that managed parameters are
  # configured correctly for policies relating to management
  # resources created by the management module instance and
  # to map the subscription to the correct management group,
  # but no resources are created by this module instance
  # subscription_id_management     = data.terraform_remote_state.management.outputs.subscription_id
  # configure_management_resources = data.terraform_remote_state.management.outputs.configuration
  deploy_management_resources = false
}