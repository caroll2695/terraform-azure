resource "azurerm_subnet" "public" {
  name                 = "${var.rg_prefix}PublicSubnet"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.public_subnet}"
}

