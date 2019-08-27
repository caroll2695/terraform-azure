resource "azurerm_virtual_network" "vnet" {
    name                = "TFVnet"
    address_space       = [var.vnet_cidr]
    location            = "${azurerm_resource_group.rg.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"

    tags = {
        environment = "Terraform Demo"
    }
}
