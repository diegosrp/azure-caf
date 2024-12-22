terraform {
  # Backend configuration
  backend "local" {
    path = "core.tfstate"
  }

  # Terraform version
  required_version = ">= 1.7.0"

  # Provider version
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.108"
    }
  }
}

# Declare a standard provider block using your preferred configuration.
# This will be used for the deployment of all "Core resources".
provider "azurerm" {
  subscription_id = var.subscriptions_ids["core"]
  features {}
}