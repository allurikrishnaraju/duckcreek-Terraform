resource "azurerm_network_security_group" "terransg" {
    name                = "${var.security_group_name}"
    location            = "${azurerm_resource_group.terrarg.location}"
    resource_group_name = "${azurerm_resource_group.terrarg.name}"

    security_rule {
        name                       = "RDP"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }
}

resource "azurerm_subnet_network_security_group_association" "subnetnsg" {
  subnet_id                 = "${azurerm_subnet.terrasubnet.id}"
  network_security_group_id = "${azurerm_network_security_group.terransg.id}"
}