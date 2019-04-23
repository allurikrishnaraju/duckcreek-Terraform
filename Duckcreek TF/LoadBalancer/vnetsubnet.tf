resource "azurerm_virtual_network" "terravnet" {
  name                = "${var.vnet_name}"
  location            = "${var.location}"
  address_space       = ["${var.address_space}"]
  resource_group_name = "${azurerm_resource_group.terrarg.name}"
  dns_servers         = "${var.dns_servers}"
}

resource "azurerm_subnet" "terrasubnet" {
  name                      = "${var.subnet_names}"
  virtual_network_name      = "${azurerm_virtual_network.terravnet.name}"
  resource_group_name       = "${azurerm_resource_group.terrarg.name}"
  address_prefix            = "${var.subnet_prefixes}"
}