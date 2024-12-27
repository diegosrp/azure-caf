# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Core resources".
provider "azurerm" {
  subscription_id = var.subscriptions_ids["core"]
  features {}
}