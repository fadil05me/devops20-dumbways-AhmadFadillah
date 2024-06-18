resource "azurerm_network_interface" "contoh" {
  count               = var.instance_count
  name                = "NIC-WUS-${count.index +1}"
  location            = azurerm_resource_group.contoh.location
  resource_group_name = azurerm_resource_group.contoh.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.contoh.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.contoh[count.index].id
  }
}

resource "azurerm_linux_virtual_machine" "contoh" {
  name                = "${var.vm_name}-WUS-${count.index +1}"
  count               = var.instance_count
  resource_group_name = azurerm_resource_group.contoh.name
  location            = azurerm_resource_group.contoh.location
  size                = "${var.spec}"
  admin_username      = "${var.username}"
  network_interface_ids = [
    azurerm_network_interface.contoh[count.index].id,
  ]

  admin_ssh_key {
    username   = "${var.username}"
    public_key = file("${var.pubkey}")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}