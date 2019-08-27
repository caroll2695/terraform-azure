resource "azurerm_network_interface" "AppNic" {
  name                = "TF-app-0-nic"
  location            = "${var.location}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  count               = "2"

  ip_configuration {
    name                          = "configuration"
    subnet_id                     = "${azurerm_subnet.private.id}"
    public_ip_address_id          = "${azurerm_public_ip.app_ip.id}"
    private_ip_address_allocation = "Dynamic"
    # load_balancer_backend_address_pools_ids = ["${azurerm_lb_backend_address_pool.backend_pool.id}"]
    # load_balancer_inbound_nat_rules_ids = ["${element(azurerm_lb_nat_rule.tcp.*.id, count.index)}"]
  }
}

resource "azurerm_public_ip" "app_ip" {
  name                         = "TF-app-0-public-ip"
  location                     = "${var.location}"
  resource_group_name          = "${azurerm_resource_group.rg.name}"
  #count                        = "${var.vm_count}"
  allocation_method            = "Static"
}