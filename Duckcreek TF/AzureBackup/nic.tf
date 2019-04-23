resource "azurerm_network_interface" "terranic" {
    name                      = "${var.virtual_machine}-nic"
    location                  = "${azurerm_resource_group.terrarg.location}"
    resource_group_name       = "${azurerm_resource_group.terrarg.name}"

    ip_configuration {
        name                          = "${var.virtual_machine}-ipconfig"
        subnet_id                     = "${azurerm_subnet.terrasubnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.terrapublicip.id}"
    }
}