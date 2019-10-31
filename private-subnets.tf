resource "azurerm_subnet" "private_subnet" {
  name                 = "${var.rg_prefix}PublicSubnet"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.private_subnet}"
}

