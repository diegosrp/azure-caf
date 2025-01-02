terraform {
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