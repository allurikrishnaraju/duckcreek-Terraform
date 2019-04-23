data "azurerm_subnet" "subnet" {
  name                 = "${var.subnet_name}"
  virtual_network_name = "${var.vnet_name}"
  resource_group_name  = "${data.azurerm_resource_group.resourcegroup.name}"
}

resource "azurerm_network_interface" "terranic" {
    count                     = "${var.total_count}" 
    name                      = "${var.virtual_machine}-nic${count.index}"
    location                  = "${data.azurerm_resource_group.resourcegroup.location}"
    resource_group_name       = "${data.azurerm_resource_group.resourcegroup.name}"

    ip_configuration {
        name                          = "${var.virtual_machine}-nic-ip1"
        subnet_id                     = "${data.azurerm_subnet.subnet.id}"
        private_ip_address_allocation = "dynamic"
    }
}
