resource "azurerm_virtual_machine" "terravm" {
    count                 = "${var.total_count}"
    name                  = "${var.virtual_machine}${count.index}"
    location              = "${var.location}"
    resource_group_name   = "${var.resource_group_name}"
    network_interface_ids = ["${element(azurerm_network_interface.terranic.*.id, count.index)}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "${var.virtual_machine}OsDisk${count.index}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2012-R2-Datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${var.virtual_machine}${count.index}"
        admin_username = "${var.admin_username}"
        admin_password = "${var.admin_password}"
    }

    os_profile_windows_config {
  }
}