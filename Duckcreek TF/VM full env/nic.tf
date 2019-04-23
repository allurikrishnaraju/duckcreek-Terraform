resource "azurerm_network_interface" "terranic" {
    name                      = "${var.network_interface}"
    location                  = "${azurerm_resource_group.terrarg.location}"
    resource_group_name       = "${azurerm_resource_group.terrarg.name}"

    ip_configuration {
        name                          = "${var.ip_conf_name}"
        subnet_id                     = "${azurerm_subnet.terrasubnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.terrapublicip.id}"
    }
}