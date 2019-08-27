resource "azurerm_subnet" "private" {
  name                 = "TF-private"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${azurerm_resource_group.rg.name}"
  address_prefix       = "${var.subnet_cidrs.private_subnet}"
}