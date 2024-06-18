terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.105.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "xxx-xx-xx-xxx-xxxxx"
  features {}
}

resource "azurerm_resource_group" "contoh" {
  name     = "RG-Fadil"
  location = "West US"
}

