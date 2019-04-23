resource "azurerm_virtual_machine" "terravm" {
    count                 = "${var.total_count}"
    name                  = "${var.virtual_machine}${count.index}"
    location              = "${var.location}"
    resource_group_name   = "${azurerm_resource_group.terrarg.name}"
    network_interface_ids = ["${element(azurerm_network_interface.terranic.*.id, count.index)}"]
    availability_set_id   = "${azurerm_availability_set.avset.id}"
    vm_size               = "Standard_DS1_v2"

    storage_os_disk {
        name              = "${var.virtual_machine}OsDisk${count.index}"
        caching           = "ReadWrite"
        create_option     = "FromImage"
        managed_disk_type = "Premium_LRS"
        disk_size_gb      = "50"
    }

    storage_image_reference {
        publisher = "MicrosoftWindowsServer"
        offer     = "WindowsServer"
        sku       = "2016-Datacenter"
        version   = "latest"
    }

    os_profile {
        computer_name  = "${var.virtual_machine}${count.index}"
        admin_username = "azureuser"
        admin_password = "Grid41312!"
    }

    os_profile_windows_config {
  }
}