resource "azurerm_virtual_network" "contoh" {
  name                = "VNET-WUS"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.contoh.location
  resource_group_name = azurerm_resource_group.contoh.name
}

resource "azurerm_subnet" "contoh" {
  name                 = "Subnet-WUS"
  resource_group_name  = azurerm_resource_group.contoh.name
  virtual_network_name = azurerm_virtual_network.contoh.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_public_ip" "contoh" {
  name                = "PIP-WUS-${count.index +1}"
  count               = var.instance_count
  resource_group_name = azurerm_resource_group.contoh.name
  location            = azurerm_resource_group.contoh.location
  allocation_method   = "Static"
}