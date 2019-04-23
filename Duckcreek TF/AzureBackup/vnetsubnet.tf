resource "azurerm_virtual_network" "terravnet" {
  name                = "${var.vnet_name}"
  location            = "${azurerm_resource_group.terrarg.location}"
  address_space       = ["${var.vnet_prefix}"]
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
}

resource "azurerm_subnet" "terrasubnet" {
  name                      = "${var.subnet_name}"
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  virtual_network_name      = "${azurerm_virtual_network.terravnet.name}"
  address_prefix            = "${var.subnet_prefixes}"
}