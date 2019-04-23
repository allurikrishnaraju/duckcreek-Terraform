resource "azurerm_public_ip" "terrapublicip" {
    name                         = "${var.public_ip}"
    location                     = "${azurerm_resource_group.terrarg.location}"
    resource_group_name          = "${azurerm_resource_group.terrarg.name}"
    allocation_method            = "Dynamic"
}