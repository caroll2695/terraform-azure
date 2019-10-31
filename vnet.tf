resource "azurerm_virtual_network" "vnet" {
  name                = "${var.virtual_network_name}"
  location            = "${var.location}"
  address_space       = ["${var.cidr}"]
  resource_group_name = "${azurerm_resource_group.rg.name}"
}