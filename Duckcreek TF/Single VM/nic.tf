data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${data.azurerm_resource_group.resourcegroup.name}"
}

resource "azurerm_network_interface" "terranic" {
    name                      = "${var.virtual_machine}-nic"
    location                  = "${data.azurerm_resource_group.resourcegroup.location}"
    resource_group_name       = "${data.azurerm_resource_group.resourcegroup.name}"

    ip_configuration {
        name                          = "${var.virtual_machine}-nic-ip1"
        subnet_id                     = "${data.azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "dynamic"
        public_ip_address_id          = "${azurerm_public_ip.terrapublicip.id}"
    }
}