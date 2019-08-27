resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.app_profile.name}"
  location              = "${azurerm_resource_group.rg.location}"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  network_interface_ids = ["${element(azurerm_network_interface.AppNic.*.id, count.index)}"]
  vm_size               = "Standard_F2"
  availability_set_id   = "${azurerm_availability_set.avset.id}"
  count                 = 2


  # This means the OS Disk will be deleted when Terraform destroys the Virtual Machine
  # NOTE: This may not be optimal in all cases.
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  
  storage_os_disk {
    name              = "osdisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  
  os_profile {
    computer_name  = "${var.app_profile.name}"
    admin_username = "${var.app_profile.username}"
    admin_password = "${var.app_profile.password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  provisioner "remote-exec" {
    connection {
      host     = "${azurerm_public_ip.app_ip.id}"
      user     = "${var.app_profile.username}"
      password = "${var.app_profile.password}"
    }

    inline = [
      "ls -la",
    ]
  } 
}


