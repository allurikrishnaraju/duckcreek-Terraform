resource "azurerm_virtual_machine" "terravm" {
    name                  = "${var.virtual_machine}"
    location              = "${azurerm_resource_group.terrarg.location}"
    resource_group_name   = "${azurerm_resource_group.terrarg.name}"
    network_interface_ids = ["${azurerm_network_interface.terranic.id}"]
    vm_size               = "${var.vm_size}"

    storage_os_disk {
        name              = "${var.virtual_machine}-OsDisk"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Standard_LRS"
    }

    storage_data_disk {
        name              = "datadisk_new"
        managed_disk_type = "Standard_LRS"
        create_option     = "Empty"
        lun               = 0
        disk_size_gb      = "30"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${var.virtual_machine}"
        admin_username = "${var.admin_username}"
        admin_password = "${var.admin_password}"
    }

    os_profile_windows_config {
  }
}