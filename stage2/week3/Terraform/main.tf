terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.105.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "change-to-your-subscription-id"
  features {}
}

resource "azurerm_resource_group" "contoh" {
  name     = "RG-Fadil"
  location = "West US"
}

