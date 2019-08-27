# output "nic-private-ip" {
#     value = "${azurerm_network_interface.AppNic.private_ip_address}"
#     value = join(",",azurerm_network_interface.AppNic.*.private_ip_address)
# }

output "nic-public-ip" {
    value = "${azurerm_public_ip.app_ip.ip_address}"
}

# output "nic-ids" {
#     value = ["${element(azurerm_network_interface.nic.*.id, count.index)}"]
# }